include_recipe "perl::perlbrew"

include_recipe "perl::perlbrew-perl-5.16.2"

include_recipe "perl::perlbrew-cpanm"

cpan_modules = [
  "inc::Module::Install",
  "Test::Perl::Critic",
  "AnyEvent",
  "AnyEvent::IRC::Connection",
  "WebService::Simple",
  "Class::Accessor::Lite",
  "JSON",
  "Mouse"
]

cpan_modules.each do |cpan_module|
  execute "cpanm #{cpan_module}" do
    user "root"
    command "/root/perl5/perlbrew/perls/perl-5.16.2/bin/perl /root/perl5/perlbrew/bin/cpanm #{cpan_module}"
    creates "/root/perl5/perlbrew/perls/perl-5.16.2/lib/site_perl/5.16.2/#{cpan_module.gsub(/::/, "/")}.pm"
  end
end

directory "/opt/minechand/lib/haracane" do
  action :create
  recursive true
end

execute "git clone https://github.com/haracane/Redmine-Chan.git" do
  user "root"
  cwd "/opt/minechand/lib/haracane"
  command "git clone https://github.com/haracane/Redmine-Chan.git"
  creates "/opt/minechand/lib/haracane/Redmine-Chan"
end
