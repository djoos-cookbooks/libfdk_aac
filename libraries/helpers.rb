#
# Cookbook Name:: libfdk_aac
# Library:: helpers
#
# Copyright 2014, Escape Studios
#

module Libfdk_aac
  module Helpers
    def libfdk_aac_packages
      [
        "fdk-aac"
      ]
    end
  end
end

class Chef::Recipe
  include Libfdk_aac::Helpers
end