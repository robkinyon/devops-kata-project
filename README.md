# devops-kata-project

Requirements:

* Vagrant 1.5+
* Virtualbox (I used 5.0.8, but 4+ should work)
* Ruby 1.9.3+ with bundler
  * I used RVM to install 2.1.7
  * Vagrant requires bundler-1.10.5 - you *cannot* use 1.10.6

Steps to run:

* `bundle install`
  * This installs serverspec
* `vagrant up`
  * This will:
    * check for required plugin installation
      * vagrant-vbguest
      * vagrant-librarian-chef
    * install the box and ensure the guest additions and Chef are correct.
    * download all required cookbooks
* `rake spec`
  * This will:
    * Verify that everything was installed properly on the VM.
