#!/bin/bash

if rvm --version 2>/dev/null; then
  gem install soloist
else
  sudo gem install soloist
fi

mkdir -p ~/cookbooks; cd ~/cookbooks

cat > soloistrc <<EOF
cookbook_paths:
- $PWD
recipes:
- pivotal_workstation::create_var_chef_cache
- pivotal_workstation::xquartz
- pivotal_workstation::locate_on
- pivotal_workstation::1password
- pivotal_workstation::gem_setup
- pivotal_workstation::bash4
- pivotal_workstation::bash_it
- pivotal_workstation::bash_completion
- pivotal_workstation::coreutils
- pivotal_workstation::findutils
- pivotal_workstation::wget
- pivotal_workstation::pwgen
- pivotal_workstation::siege
- pivotal_workstation::xmlstarlet
- pivotal_workstation::watch
- pivotal_workstation::rvm
- pivotal_workstation::alfred
- pivotal_workstation::chrome
- pivotal_workstation::dropbox
- pivotal_workstation::firefox
- pivotal_workstation::github_for_mac
- pivotal_workstation::bartender
- pivotal_workstation::istatmenus
- pivotal_workstation::phpstorm
- pivotal_workstation::things
- pivotal_workstation::viscosity
- pivotal_workstation::root_shell_bash
- pivotal_workstation::optipng
- pivotal_workstation::jpegoptim
- pivotal_workstation::gnu-tar
- pivotal_workstation::mysql
- pivotal_workstation::postgres
- pivotal_workstation::psycopg2
- pivotal_workstation::mysql-python
- pivotal_workstation::imagemagick
- pivotal_workstation::unhide_home
- pivotal_workstation::php54
- pivotal_workstation::mod-jk
- pivotal_workstation::composer
- pivotal_workstation::sequelpro
- pivotal_workstation::tower
- pivotal_workstation::kaleidoscope2
- pivotal_workstation::omnigraffle
- pivotal_workstation::standby-delay
- roderik_workstation::sublime_packages
- roderik_workstation::inputrc
- kmachine::update
- kmachine::ssh_config
- kmachine::kstrano
- kmachine::vagrant
- kmachine::kdeploy
- kmachine::apache_kdeploy
- kmachine::phpconfig
EOF

#- roderik_workstation::bashrc
#- kmachine::kms


if [[ -d pivotal_workstation ]]; then
  cd pivotal_workstation && git pull && cd ..
else
  git clone https://github.com/roderik/pivotal_workstation.git
fi
if [[ -d dmg ]]; then
  cd dmg && git pull && cd ..
else
  git clone https://github.com/opscode-cookbooks/dmg.git
fi
if [[ -d roderik_workstation ]]; then
  cd roderik_workstation && git pull && cd ..
else
  git clone https://github.com/roderik/roderik_workstation.git
fi
soloist
