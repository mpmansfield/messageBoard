#!/bin/bash
umask 022

cd ~

source /etc/profile
cd /messageBoard

bundle install #--deployment --without development test
#bundle exec rake secret:replace

echo 'All done!'

bundle exec puma