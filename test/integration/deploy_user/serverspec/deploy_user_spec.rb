require 'spec_helper'
describe 'my_web_server_cookbook::deploy_user' do
  describe command('cut -d: -f1 /etc/passwd') do
    its(:stdout) { should match /deploy/ }
  end

  describe command('getent group sudo') do
    its(:stdout) { should match /deploy/ }
  end

  describe file('/etc/sudoers.d/deploy') do
    it { should be_file }
  end

  describe command('cat /etc/sudoers.d/deploy') do
    its(:stdout) { should match /deploy ALL=\(ALL\) NOPASSWD:ALL/ }
  end
end
