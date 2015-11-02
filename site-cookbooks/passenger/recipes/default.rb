apt_repository :passenger do
  uri 'https://oss-binaries.phusionpassenger.com/apt/passenger'
  distribution 'trusty'
  components ['main']
  key '561F9B9CAC40B2F7'
  keyserver 'keyserver.ubuntu.com'
end

package 'nginx-extras' do
  options '-o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold"'
  action :install
end

package 'passenger' do
  action :install
end
