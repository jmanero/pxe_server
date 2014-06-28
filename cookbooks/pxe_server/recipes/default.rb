#
# Cookbook Name:: pxe_server
# Recipe:: default
#
# Copyright (C) 2013 John Manero
#
# All rights reserved - Do Not Redistribute
#
include_recipe "apt"

execute "Restart Networking" do
  command "/etc/init.d/networking restart"
  action :nothing
end

execute "Load IPTables" do
  command "cat /etc/network/iptables | iptables-restore"
  action :nothing
end

execute "Enable IPv4 Forwarding" do
  command "echo 1 > /proc/sys/net/ipv4/ip_forward"
  only_if { ::IO.read("/proc/sys/net/ipv4/ip_forward").strip != "1" }
end

template "/etc/network/interfaces" do
  source "interfaces.erb"
  backup false
  notifies :run, "execute[Restart Networking]", :immediately
end

template "/etc/network/iptables" do
  source "iptables.erb"
  backup false
  notifies :run, "execute[Load IPTables]", :immediately
end

package "syslog-ng"
package "tftpd-hpa"
package "tftp-hpa"
package "isc-dhcp-server"

service "syslog-ng" do
  action [:start, :enable]
  # provider Chef::Provider::Service::Upstart
end

service "tftpd-hpa" do
  action [:start, :enable]
  provider Chef::Provider::Service::Upstart
end

service "isc-dhcp-server" do
  action [:start, :enable]
  provider Chef::Provider::Service::Upstart
end

template "/etc/default/tftpd-hpa" do
  source "tftpd.default.erb"
  backup false
  notifies :restart, "service[tftpd-hpa]"
end

template "/etc/dhcp/dhcpd.conf" do
  source "dhcpd.conf.erb"
  backup false
  notifies :restart, "service[isc-dhcp-server]"
end
