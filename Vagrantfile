# -*- mode: ruby -*-
# vi: set ft=ruby :

RAM = 512
NUMBER_SLAVES = 1

Vagrant.configure(2) do |config|
  config.vm.box = "boxcutter/ubuntu1404"
  config.ssh.insert_key = false

  config.vm.provider :virtualbox do |v|
    v.check_guest_additions = false
    v.customize ["modifyvm", :id, "--cpus", "1", "--memory", RAM]
  end

  config.vm.define :haproxy do |haproxy|
    haproxy.vm.hostname = "haproxy"
    haproxy.vm.network "private_network", ip: "10.0.0.200"
  end

  config.vm.define :master do |master|
    master.vm.hostname = "master"
    master.vm.network "private_network", ip: "10.0.0.100"
  end

  NUMBER_SLAVES.times do |i|
    slave_id = "slave-%02d" % "#{i + 1}"
    config.vm.define slave_id do |slave|
      slave.vm.hostname = slave_id
      slave.vm.network "private_network", ip: "10.0.0.#{10 + i}"
    end
  end
end
