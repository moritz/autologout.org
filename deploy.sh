#!/bin/sh
perl convert.pl
rsync -a --delete output/* /var/www/autologout.org/
