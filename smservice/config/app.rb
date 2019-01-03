module App
  module Initializer
    class << self
      include EM::Deferrable

      def load_app
        #log that app loaded all files and ready to start from this point
        succeed
      end
    end
  end

  module Destructor
    class << self
      include EM::Deferrable

      def release_resources
        #log that app is closing. Think about a way to make this logic be able to differ closing reasons
        succeed
      end
    end
  end

  class << self
    extend Forwardable

    def root
      @root ||= File.dirname(File.expand_path('..', __FILE__))
    end

    def environment
      @default_env ||= ENV['SMSERVICE_ENV'] || 'development'
    end
    alias env environment

    def_delegator Initializer, :load_app, :init
    def_delegator Destructor, :release_resources, :close
  end
end