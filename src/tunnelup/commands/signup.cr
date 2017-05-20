module Tunnelup
  module Commands
    class Signup < ::Admiral::Command
      define_flag email : String, required: true
      define_flag password : String, required: true

      def run
        user = Tunnelup::Client.signup(
          email: flags.email,
          password: flags.password,
        )

        puts user.to_json
      rescue Tunnelup::UnauthorizedError
        puts "Invalid signup attempt"
      end
    end
  end
end
