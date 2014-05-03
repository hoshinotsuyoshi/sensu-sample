Dir.glob(['sensu/conf.d/*.json', 'sensu/*.json']).each do |path|
  string = File.read(path)
  ENV.each do |k,v|
    string = string.gsub(/\$#{k}/, v)
  end
  File.open(path, 'w'){|f| f.write string}
end
