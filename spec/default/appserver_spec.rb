%w(passenger nginx-extras).each do |pkg|
  describe package(pkg), :if => os[:family] == 'ubuntu' do
    it { should be_installed }
  end
end
