require './heroku_variables_load'

Dir.glob(['/etc/sensu/conf.d/*.json', '/etc/sensu/*.json']).each do |path|
  string = File.read(path)
  ENV.each do |k,v|
    string = string.gsub(/\$#{k}/, v)
  end
  File.open(path, 'w'){|f| f.write string}
end
