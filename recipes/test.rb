include_recipe 'apt'

bash 'set hostname' do
  user 'root'
  code <<-EOH
  echo 127.0.0.1 `hostname` >> /etc/hosts
  EOH
end
