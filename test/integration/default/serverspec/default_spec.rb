require 'spec_helper'

describe 'my_web_server_cookbook::default' do

  # Serverspec examples can be found at
  # http://serverspec.org/resource_types.html

  describe package('apache2') do
    it { should be_installed }
  end

  describe service('apache2') do
    it { should be_running }

    it { should be_enabled }
  end
end
