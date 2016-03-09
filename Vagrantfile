require 'socket'
require 'fileutils'

Vagrant.require_version ">= 1.6.0"
USER = ENV['USER']
ENV['VAGRANT_DEFAULT_PROVIDER'] = 'docker'

host_ip_obj = Socket.ip_address_list.detect{|intf| intf.ipv4_private?}
host_ip = host_ip_obj.ip_address

# The Docker host typically uses CONFIG, hence LOCAL_CONFIG
LOCAL_CONFIG = File.join(File.dirname(__FILE__), "config.rb")

# We don't define defaults for most things, as we really need
# user defined variables for a lot of things
#
# Copy config.rb.sample to config.rb and edit as needed
BIND_ADDRESS="0.0.0.0"
ENVIRONMENT="development"
SERVICE_NAME="bot"
EXPRESS_USER="vagrant"
EXPRESS_PASSWORD="vagrant"
PORT="8080"
HUBOT_ADAPTER="shell"
HUBOT_ALIAS="hu"
HUBOT_NAME="bot"
HUBOT_AWS_KEY=""
HUBOT_AWS_SECRET=""
HUBOT_AWS_S3_BUCKET=""
HUBOT_LOG_LEVEL="debug"
REDIS_URL="redis://#{host_ip}:6379"
HUBOT_SLACK_TOKEN=""

if File.exist?(LOCAL_CONFIG)
  # Supress warning messages.
  original_verbose, $VERBOSE = $VERBOSE, nil
  require LOCAL_CONFIG
  # Activate warning messages again.
  $VERBOSE = original_verbose
end

Vagrant.configure("2") do |config|
  config.vm.provider "docker" do |d|
    d.vagrant_vagrantfile = "../coreos-vagrant/Vagrantfile"
    d.vagrant_machine = 'core-01'
    d.build_dir = "."
    d.host_vm_build_dir_options = { :type => "rsync", :rsync__exclude => ".git/" }
    d.force_host_vm = true
    d.ports = ["14242:#{PORT}"]
    d.env = {
      :DEV_HOST => host_ip,
      :BIND_ADDRESS => BIND_ADDRESS,
      :ENVIRONMENT => ENVIRONMENT,
      :EXPRESS_USER => EXPRESS_USER,
      :EXPRESS_PASSWORD => EXPRESS_PASSWORD,
      :PORT => PORT,
      :HUBOT_ADAPTER => HUBOT_ADAPTER,
      :HUBOT_ALIAS => HUBOT_ALIAS,
      :HUBOT_NAME => HUBOT_NAME,
      :HUBOT_LOG_LEVEL => HUBOT_LOG_LEVEL,
      :REDIS_URL => REDIS_URL,
      :HUBOT_SLACK_TOKEN => HUBOT_SLACK_TOKEN
    }
    d.remains_running = true
  end
end

