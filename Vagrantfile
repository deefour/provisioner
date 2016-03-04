require "yaml"

VAGRANTFILE_API_VERSION = "2"
HOSTNAME = `hostname`.strip.gsub(/\W+/, '-')
PLAYBOOK = File.join(__dir__, "vagrant", "vagrant-#{HOSTNAME}.yml")

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box            = "holms/centos7"
  config.vm.hostname       = "deebox"
  config.ssh.forward_agent = true

  #
  # NFS config for folder sync.
  #
  config.nfs.map_uid = Process.uid
  config.nfs.map_gid = Process.gid

  config.vm.network "private_network", type: "dhcp"



  #
  # Provisioning
  #
  config.vm.provision "ansible" do |ansible|
    ansible.playbook = PLAYBOOK
    ansible.sudo     = true
  end



  #
  # Sync ports and directories between the host machine and the vagrant box.
  #
  vars = YAML.load_file(PLAYBOOK)[0]["vars"]

  ports = vars.include?("ports") ? vars["ports"] : []
  sites = vars.include?("sites") ? vars["sites"] : []

  ports.each do |port|
    host_port = port.to_s.ljust(5, "0").gsub(/00$/, "0") if port.to_i < 6553

    config.vm.network :forwarded_port, guest: port, host: (host_port || port)
  end

  sites.each do |site|
    config.vm.synced_folder site["src"], "/var/www/#{site["host"]}", nfs: true
  end



  #
  # Virtualbox-specific configuration.
  #
  # @link https://stefanwrobel.com/how-to-make-vagrant-performance-not-suck
  #
  config.vm.provider "virtualbox" do |vb|
    host = RbConfig::CONFIG['host_os']

    # Give VM 1/4 system memory & access to all cpu cores on the host
    if host =~ /darwin/
      cpus = `sysctl -n hw.ncpu`.to_i
      # sysctl returns Bytes and we need to convert to MB
      mem = `sysctl -n hw.memsize`.to_i / 1024 / 1024 / 4
    elsif host =~ /linux/
      cpus = `nproc`.to_i
      # meminfo shows KB and we need to convert to MB
      mem = `grep 'MemTotal' /proc/meminfo | sed -e 's/MemTotal://' -e 's/ kB//'`.to_i / 1024 / 4
    else # sorry Windows folks, I can't help you
      cpus = 2
      mem = 1024
    end

    vb.memory = mem
    vb.cpus = cpus
  end
end
