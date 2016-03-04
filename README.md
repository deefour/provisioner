# Provisioner

[![License](http://img.shields.io/:license-mit-blue.svg)](http://deefour.mit-license.org)

Ansible configuration for a Centos7 LAMP server, `Vagrantfile` included.

## Getting Started

_**Note:** These scripts have only been tested to work on CentOS7 x86 64._

### Vagrant

 1. Run the following from the command line.

      ```bash
      ruby -e 'puts `hostname`.strip.gsub(/\W+/, "-")'
      ```

 1. Copy `provisioning/vagrant.example.yml` to `provisioning/vagrant.[HOSTNAME].yml`. For me, the above command returns `dee4-local` so the file is `provisioning/vagrant.dee4-local.yml`.
 2. Customize this copied playbook to suit your needs.
 2. Run `vagrant up --provision` to build your box.

### Other Environments

 1. Create your ansible inventory file in `provisioning/`
 2. Create new playbook(s) in `provisioning/` to point at hosts/groups in your inventory file.
 4. Run ansible.

The first time ansible is run, you may need to set `ansible_ssh_user=root` in your inventory file for each host. For subsequent plays, you should configure the user and private key file for your wheel user on each host.

```
[example.com]
host1.example.com    ansible_ssh_user=dee4    ansible_ssh_private_key=~/.ssh/jason@deefour.me
```

## Supported Software

_**Note:** [Submit a ticket](https://github.com/deefour/provisioner/issues) if you want to see something added._

### Common Role

 - [NodeJS 0.10](https://nodejs.org/en/)
 - [s3tools](http://s3tools.org/s3cmd)
 - [Git](https://git-scm.com/)
 - [Supervisor](http://supervisord.org/)
 - [Ruby](https://www.ruby-lang.org/en/), [chruby](https://github.com/postmodern/chruby), and [ruby-install](https://github.com/postmodern/ruby-install)

### Application Role

 - [PHP 5.6](http://php.net)
 - [Apache 2.4](http://httpd.apache.org/)
 - [Passenger](https://www.phusionpassenger.com/)

### Worker Role

 - [Mailhog](https://github.com/mailhog/MailHog)
 - [SSMTP](https://wiki.archlinux.org/index.php/SSMTP)

### Database Role

 - [Redis 2.8](http://redis.io/)
 - [MariaDB 15.1](https://mariadb.org/)

## Contribute

- Issue Tracker: https://github.com/deefour/provisioner/issues
- Source Code: https://github.com/deefour/provisioner

## Changelog

#### 0.1.0 - August 24, 2015

 - Initial release.

## License

Copyright (c) 2015 [Jason Daly](http://www.deefour.me) ([deefour](https://github.com/deefour)). Released under the [MIT License](http://deefour.mit-license.org/).
