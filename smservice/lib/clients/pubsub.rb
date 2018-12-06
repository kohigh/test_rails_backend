module PubSub
  class SMSClientMissingError < StandardError; end

  class << self
    def configure(sms_messenger, redis_url:, **args)
      raise SMSClientMissingError unless sms_messenger

      @sms_messenger = sms_messenger

      @redis_url = redis_url

      App::Initializer.callback(&method(:connect))
      App::Destructor.callback(&method(:disconnect))

      self
    end

    private

    def connect
      @client = EM::Hiredis.connect(@redis_url)

      @pubsub = @client.pubsub
      @pubsub.subscribe('users.messages')
      @pubsub.on(:message) do |_, msg|
        begin
          sms = SMS.new(JSON.parse(msg, symbolize_names: true))

          @sms_messenger.deliver(sms)
        rescue ArgumentError => e
          # Good place for logging
        end
      end

      puts 'connected'
    end

    def disconnect
      @pubsub&.unsubscribe('users.messages')

      @client&.close_connection

      puts 'disconnected'
    end
  end
end