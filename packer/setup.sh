#!/bin/bash

set -e
set -o pipefail

install_nodejs() {
    sudo apt-get update
    apt-get install curl -y
    sudo curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash
    sudo apt-get install gcc g++ make -y
    sudo apt-get install -y nodejs
    node --version
}

npm_install() {
    sudo npm install -g gulp-cli serve
    sudo npm install
}

gulp_sass() {
    sudo gulp sass
}

install_python() {
    sudo apt purge python-pip python3-pip -y
    sudo rm -rf /usr/local/lib/python2.7/dist-packages/pip
    sudo rm -rf /usr/local/lib/python3.4/dist-packages/pip
    sudo apt-get update
    sudo apt-get install -y software-properties-common
    sudo add-apt-repository ppa:deadsnakes/ppa -y
    sudo apt-get update
    sudo apt-get install -y python3 python3-pip python-pip curl

    sudo rm -rf /usr/local/bin/pip3
    sudo rm -rf /usr/local/bin/pip
    sudo rm -rf /usr/local/lib/python3.4/dist-packages/setuptools
    sudo rm -rf /usr/local/lib/python3.4/dist-packages/wheel
    sudo rm -rf /usr/local/lib/python3.4/dist-packages/pkg_resources
    sudo apt-get install --reinstall python3-setuptools python3-wheel python3-pkg-resources -y
}

install_supervisor() {
    sudo pip3 install supervisor
}

setup_supervisor_script() {
    sudo touch /etc/init.d/supervisord
    sudo curl https://gist.githubusercontent.com/danmackinlay/176149/raw/d60b505a585dda836fadecca8f6b03884153196b/supervisord.sh > /etc/init.d/supervisord
    sudo chmod +x /etc/init.d/supervisord
    sudo update-rc.d supervisord defaults
}

touch_config_file() {
    sudo mkdir -p /etc/supervisor/conf.d
    sudo touch /etc/supervisor/conf.d/api.conf
}

copy_start_script() {
    sudo chmod +x packer/start.sh
}

write_supervisor_conf() {
  sudo cat <<EOF > /etc/supervisor/conf.d/buddy.conf
[program:app]
command=/bin/bash packer/start.sh
directory=/home/ubuntu
autostart=true
autorestart=true
startretries=3
EOF
}

install_application_requirements() {
    sudo apt-get install python3-dev postgresql-contrib python3-psycopg2 libpq-dev -y
    sudo apt-get install build-essential libssl-dev libffi-dev python-dev -y
    sudo pip3 install -r requirements.txt
}

start_supervisor() {
    sudo service supervisord start
}

main() {
    install_nodejs

    npm_install

    gulp_sass

    install_python

    install_supervisor

    setup_supervisor_script

    touch_config_file

    copy_start_script

    write_supervisor_conf

    install_application_requirements
}

main "$@"