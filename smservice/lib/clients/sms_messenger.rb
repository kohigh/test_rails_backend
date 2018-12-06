module SMSMessenger
  class << self
    def configure(url:, auth_username:, auth_password:, phone_from:,  **args)
      @url = url
      @auth_username = auth_username
      @auth_password = auth_password
      @phone_from = phone_from
    end

    def deliver(sms)
      @request = EM::HttpRequest.new(@url).post(
        head: {
          'Authorization' => [@auth_username, @auth_password],
          'Content-Type' => 'application/x-www-form-urlencoded',
          'Accept' => 'application/json'
        },
        body: URI.encode_www_form({ To: sms.phone, From: @phone_from, Body: sms.to_s })
      )

      @request.callback do
        case @request.response_header.status
          when 201 then puts @request.req.body# log everything is ok or not log it's up to you
          when 422 then puts 'errors'# log with specified errors
          else # log with detailed info about response
        end
      end
      @request.errback # Place for logging and think about(happens in dns problems or timeouts)
    end
  end
end