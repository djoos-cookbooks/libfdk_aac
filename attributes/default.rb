#
# Cookbook Name:: libfdk_aac
# Attributes:: default
#
# Copyright 2014, Escape Studios
#

default['libfdk_aac']['install_method'] = :source
default['libfdk_aac']['prefix'] = '/usr/local'
default['libfdk_aac']['git_repository'] = 'git://github.com/mstorsjo/fdk-aac.git'
default['libfdk_aac']['compile_flags'] = []

# JW 07-06-11: Hash of commit or a HEAD should be used - not a tag. Sync action of Git
# provider will always attempt to update the git clone if a tag is used. (v0.1.0)
default['libfdk_aac']['git_revision'] = '78443185d4f09dd1ffd459dd333407d2458fb4e4'
