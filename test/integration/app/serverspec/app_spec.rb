require 'spec_helper'
describe 'my_web_server_cookbook::app' do
  describe file('/var/www') do
    it { should be_owned_by 'deploy' }
  end

  describe file('/var/www') do
    it { should be_grouped_into 'deploy' }
  end
end
