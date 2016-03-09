namespace :environment do
  task :common do
    registry 'Dockerhub'
    set :image, 'registry.hub.docker.com/spkane/mybot'
    set :status_endpoint, "/status/check"

    env_vars SERVICE_NAME: 'mybot'
  end

  task :development => :common do
    set_current_environment(:development)

    env_vars ENVIRONMENT: 'development'
    env_vars SERVICE_ENV: 'development'
    env_vars EXPRESS_USER: ''
    env_vars EXPRESS_PASSWORD: ''
    env_vars BIND_ADDRESS: '0.0.0.0'
    env_vars PORT: '8080'
    env_vars HUBOT_ADAPTER: 'slack'
    env_vars HUBOT_ALIAS: '/'
    env_vars HUBOT_NAME: 'devbot'
    env_vars HUBOT_LOG_LEVEL: 'debug'
    env_vars REDIS_URL: 'redis://127.0.0.1:16679'
    env_vars HUBOT_SLACK_TOKEN: ENV['HUBOT_SLACK_TOKEN']
    env_vars HUBOT_DEBUG: 'true'

    host_port 14242, container_port: 8080
    host '127.0.0.1'

  end

  task :staging => :common do
    set_current_environment(:staging)

    env_vars ENVIRONMENT: 'staging'
    env_vars SERVICE_ENV: 'staging'
    env_vars EXPRESS_USER: ''
    env_vars EXPRESS_PASSWORD: ''
    env_vars BIND_ADDRESS: '0.0.0.0'
    env_vars PORT: '8080'
    env_vars HUBOT_ADAPTER: 'slack'
    env_vars HUBOT_ALIAS: '/'
    env_vars HUBOT_NAME: 'testbot'
    env_vars HUBOT_LOG_LEVEL: 'debug'
    env_vars REDIS_URL: 'redis://127.0.0.1:6379'
    env_vars HUBOT_SLACK_TOKEN: ENV['HUBOT_SLACK_TOKEN']
    env_vars HUBOT_DEBUG: 'true'

    memory 2.gigabytes
    cpu_shares 512

    host_port 14242, container_port: 8080
    host '127.0.0.1'

  end

  task :production => :common do
    set_current_environment(:production)

    env_vars ENVIRONMENT: 'production'
    env_vars SERVICE_ENV: 'production'
    env_vars BIND_ADDRESS: '0.0.0.0'
    env_vars EXPRESS_USER: ''
    env_vars EXPRESS_PASSWORD: ''
    env_vars PORT: '8080'
    env_vars HUBOT_ADAPTER: 'slack'
    env_vars HUBOT_ALIAS: '/'
    env_vars HUBOT_NAME: 'bot'
    env_vars HUBOT_LOG_LEVEL: 'info'
    env_vars REDIS_URL: 'redis://127.0.0.1:6379'
    env_vars HUBOT_SLACK_TOKEN: ENV['HUBOT_SLACK_TOKEN']
    env_vars HUBOT_DEBUG: 'false'

    memory 2.gigabytes
    cpu_shares 512

    host_port 14242, container_port: 8080
    host '127.0.0.1'

  end

end
