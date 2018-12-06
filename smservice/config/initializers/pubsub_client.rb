configs = YAML.load(File.read("#{App.root}/config/pubsub.yml"))

begin
  PubSub.configure(SMSMessenger, configs[App.env])
rescue ArgumentError => e
  # Place for error logs and think about
end
