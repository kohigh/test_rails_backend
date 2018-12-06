configs = YAML.load(File.read("#{App.root}/config/sms.yml"))

begin
  SMS.configure(configs)
rescue ArgumentError => e
  # Place for error logs and think about
end