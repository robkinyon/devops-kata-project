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

directory '/var/www' do
  action :create
  recursive true
end

template '/var/www/index.html' do
  source 'index_html.erb'
  mode '0644'
  owner 'root'
  group 'root'
end
