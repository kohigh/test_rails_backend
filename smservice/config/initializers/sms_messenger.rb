configs = YAML.load(File.read("#{App.root}/config/sms_messenger.yml"))

begin
  SMSMessenger.configure(configs[App.env])
rescue ArgumentError => e
  # Place for error logs and think about
end
