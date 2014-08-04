require 'spec_helper'

describe 'libfdk_aac::default' do
  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }
end
