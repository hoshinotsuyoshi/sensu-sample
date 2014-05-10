require './heroku_variables_load'

# heroku env
Dir.glob(['/etc/sensu/conf.d/*.json', '/etc/sensu/*.json']).each do |path|
  string = File.read(path)
  ENV.each do |k,v|
    string = string.gsub(/\$#{k}/, v)
  end
  File.open(path, 'w'){|f| f.write string}
end

# graphite address
path = '/etc/sensu/config.json'
string = File.read(path)
ip_address = ENV['GRAPHITE_PORT_2003_TCP_ADDR']
string = string.gsub('$GRAPHITE_IP_ADDRESS', ip_address)
File.open(path, 'w'){|f| f.write string}
