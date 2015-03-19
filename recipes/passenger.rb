#
# Cookbook Name:: my_web_server_cookbook
# Recipe:: passenger
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

include_recipe 'my_web_server_cookbook::ruby'

package 'apache2-threaded-dev'

package 'ruby-dev'

package 'libapr1-dev'

package 'libaprutil1-dev'

gem_package 'passenger' do
  action :install
end

execute "sudo dd if=/dev/zero of=/swap bs=1M count=1024" do
  action :run
  not_if { ::File.exists?("/swap")}
end

execute "sudo mkswap /swap" do
  action :run
  not_if { ::File.exists?("/swap")}
end

execute "sudo swapon /swap" do
  action :run
  not_if { ::File.exists?("/swap")}
end

execute 'passenger-install-apache2-module' do
  command "sudo passenger-install-apache2-module --auto"
  action :run
  not_if { ::File.exists?("/var/lib/gems/1.9.1/gems/passenger-5.0.4/buildout/apache2/mod_passenger.so")}
end

template '/etc/apache2/apache2.conf' do
  source 'apache2.conf.erb'
end

service 'apache2' do
  action [:restart]
end
