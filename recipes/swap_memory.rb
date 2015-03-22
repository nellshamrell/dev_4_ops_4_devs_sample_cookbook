#
# Cookbook Name:: my_web_server_cookbook
# Recipe:: swqp_memory
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

execute "sudo dd if=/dev/zero of=/swap bs=1M count=1024" do
  action :run
  not_if { ::File.exists?("/swap")}
end

execute "sudo mkswap /swap" do
  action :run
end

execute "sudo swapon /swap" do
  action :run
end

