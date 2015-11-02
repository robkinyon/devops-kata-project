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

file '/etc/nginx/conf.d/passenger.conf' do
  content 'passenger_root /usr/lib/ruby/vendor_ruby/phusion_passenger/locations.ini;'
  notifies :restart, 'service[nginx]', :delayed
end
