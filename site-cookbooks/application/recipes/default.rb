gem_package 'bundler' do
  notifies :restart, 'service[nginx]', :delayed
end

template '/etc/nginx/conf.d/application.conf' do
  source 'application_conf.erb'
  mode '0644'
  owner 'root'
  group 'root'
  variables({
    :root_directory => '/var/www',
  })
  notifies :restart, 'service[nginx]', :delayed
end

link '/var/www' do
  to '/vagrant/application'
  notifies :restart, 'service[nginx]', :delayed
end

execute 'bundle install' do
  cwd '/var/www'
  notifies :restart, 'service[nginx]', :delayed
end
