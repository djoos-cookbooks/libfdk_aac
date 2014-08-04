#
# Cookbook Name:: libfdk_aac
# Library:: helpers
#
# Copyright 2014, Escape Studios
#

# LibfdkAac module
module LibfdkAac
  # helpers module
  module Helpers
    def libfdk_aac_packages
      [
        'fdk-aac'
      ]
    end
  end
end

# Chef class
class Chef
  # Recipe class
  class Recipe
    include LibfdkAac::Helpers
  end
end
