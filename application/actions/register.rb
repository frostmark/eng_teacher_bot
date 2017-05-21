module Application
  module Actions
    class Register < Base
      def call
        Models::User.new.create
      end
    end
  end
end
