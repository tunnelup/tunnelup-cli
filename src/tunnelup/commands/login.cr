module Tunnelup
  module Commands
    class Login < ::Admiral::Command
      define_help description: "Login to your account"

      define_flag email : String, required: true
      define_flag password : String, required: true

      def run
        user = Tunnelup::Client.login(
          email: flags.email,
          password: flags.password,
        )

        puts user.to_json
      end
    end
  end
end
