# q.v. https://www.phusionpassenger.com/library/install/nginx/install/oss/trusty/
apt_repository :passenger do
  uri 'https://oss-binaries.phusionpassenger.com/apt/passenger'
  distribution 'trusty'
  components ['main']
  key '561F9B9CAC40B2F7'
  keyserver 'keyserver.ubuntu.com'
end

package 'nginx-extras' do
  # q.v. http://serverfault.com/a/605168
  options '-o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold"'
  action :install
end

package 'passenger' do
  action :install
end

template '/etc/nginx/conf.d/passenger.conf' do
  source 'passenger_conf.erb'
  mode '0644'
  owner 'root'
  group 'root'
  variables({
    :passenger_root => `passenger-config --root`.chomp!,
    :passenger_ruby => `which passenger_free_ruby`.chomp!,
  })
  notifies :restart, 'service[nginx]', :delayed
end
