module PubSub
  class << self
    extend Forwardable

    def connect
      @pubsub_client ||= Redis.new

      self
    end

    private

    def_delegator :@pubsub_client, :publish
  end
end