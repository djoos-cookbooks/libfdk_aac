#
# Cookbook Name:: libfdk_aac
# Recipe:: source
#
# Copyright 2014, Escape Studios
#

include_recipe "build-essential"
include_recipe "git"

libfdk_aac_packages.each do |pkg|
    package pkg do
        action :purge
    end
end

yasm_package = value_for_platform(
    [ "ubuntu" ] => { "default" => "yasm" },
    "default" => "yasm"
)

package yasm_package do
    action :upgrade
end

libtool = value_for_platform(
    [ "ubuntu" ] => { "default" => "libtool" },
    "default" => "libtool"
)

package libtool do
    action :install
end

autoconf = value_for_platform(
    [ "ubuntu" ] => { "default" => "autoconf" },
    "default" => "autoconf"
)

package autoconf do
    action :install
end

git "#{Chef::Config[:file_cache_path]}/libfdk_aac" do
    repository node[:libfdk_aac][:git_repository]
    reference node[:libfdk_aac][:git_revision]
    action :sync
    notifies :run, "bash[compile_libfdk_aac]", :immediately
end

#write the flags used to compile to disk
template "#{Chef::Config[:file_cache_path]}/libfdk_aac-compiled_with_flags" do
    source "compiled_with_flags.erb"
    owner "root"
    group "root"
    mode 0600
    variables(
        :compile_flags => node[:libfdk_aac][:compile_flags]
    )
    notifies :run, "bash[compile_libfdk_aac]", :immediately
end

bash "compile_libfdk_aac" do
    cwd "#{Chef::Config[:file_cache_path]}/libfdk_aac"
    code <<-EOH
        autoreconf -fiv
        ./configure --prefix=#{node[:libfdk_aac][:prefix]} #{node[:libfdk_aac][:compile_flags].join(' ')}
        make clean && make && make install
    EOH
    action :nothing
end