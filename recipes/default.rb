#
# Cookbook Name:: libfdk_aac
# Recipe:: default
#
# Copyright 2014, Escape Studios
#

case node['libfdk_aac']['install_method']
when :source
  include_recipe 'libfdk_aac::source'
when :package
  include_recipe 'libfdk_aac::package'
end
