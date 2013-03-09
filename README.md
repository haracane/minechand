Minechand
=========

Minechand is Redmine-Chan daemon tool.

Minechand supports:

* Quick Redmine-Chan install
* Automatically participation to all Redmine projects' IRC channels using the project identifiers. ex) #project
* Plugin installation of your favorite Redmine-Chan

## Install

Install Ruby (if you don't have)

    # bash < <(curl -s https://raw.github.com/wayneeseguin/rvm/master/binscripts/rvm-installer)
    # source /etc/profile.d/rvm.sh
    # rvm install ruby

Install Chef (if you don't have)

    # gem install chef

Install Minechand

    # cd /opt
    # git clone https://github.com/haracane/minechand.git
    # ./minechand/bin/install-minechand

### Notice

Minechand also installs:

* Perlbrew to /root/perl5/perlbrew
* cpanm to /root/perl5/perlbrew/bin/cpanm
* Perl5.16.2 to /root/perl5/perlbrew/perls/perl-5.16.2
* CPAN modules for Redmine-Chan to /root/perl5/perlbrew/perls/perl-5.16.2/lib

## Usage

### Register Redmine URL & API Key
    # vi /opt/minechand/conf.d/redmine.sh
    REDMINE_URL=http://your-redmine.com/
    REDMINE_API_KEY=abcdefghijklmnopqrstuvwxyz0123456789

### Start minechand

    # /etc/init.d/minechand start
    
### Stop minechand

    # /etc/init.d/minechand stop
    
### Plugin your favorite Redmine-Chan

    # mkdir /opt/minechand/lib/xxxxxx
    # cd /opt/minechand/lib/xxxxxx
    # git clone http://github.com/xxxxxx/Redmine-Chan.git
    # echo "LIB_DIR=/opt/minechand/lib/xxxxxx" > /opt/minechand/conf.d/Redmine-Chan.sh

## Contributing to Minechand
 
* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet.
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it.
* Fork the project.
* Start a feature/bugfix branch.
* Commit and push until you are happy with your contribution.
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

## Copyright

Copyright (c) 2013 Kenji Hara. See LICENSE.txt for further details.
