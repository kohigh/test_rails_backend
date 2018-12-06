class UserCreator
  class << self
    def create(params)
      user = User.create(params)

      PubSub.publish('users.messages', user.attributes.merge(type: :registration).to_json)

      user
    end
  end
end