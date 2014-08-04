#
# Cookbook Name:: libfdk_aac
# Recipe:: package
#
# Copyright 2014, Escape Studios
#

libfdk_aac_packages.each do |pkg|
  package pkg do
    action :upgrade
  end
end
