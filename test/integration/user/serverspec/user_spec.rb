require 'spec_helper'
describe 'my_web_server_cookbook::user' do
  describe file('/home/deploy/.ssh') do
    it { should be_directory }
  end

  describe file('/home/deploy/.ssh/authorized_keys') do
    it { should be_file }

    its(:content) { should match /ssh-rsa.+nellshamrell@gmail.com/ }
  end

  
end
