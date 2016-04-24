set :branch, :master
set :rails_env, :production
set :deploy_to, '/home/deployer/bite_url/'
set :current_deploy_path, "/home/deployer/bite_url/current"

server '52.11.154.135',
user: 'deployer',
roles: %w{app db web},
ssh_options: {
  user: 'deployer',
  keys: %w(~/.ssh/id_rsa ~/Copy/amazon/biteurl.pem),
  #keys: %w(/media/kai/Data/copy_file/amazon/ggogungmail.pem),
  auth_methods: %w(publickey)
}
