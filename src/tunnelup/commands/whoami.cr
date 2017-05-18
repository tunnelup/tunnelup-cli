module Tunnelup
  module Commands
    class Whoami < ::Admiral::Command
      define_help description: "Outputs the current user logged in"

      define_flag api_token : String, required: true

      def run
        client = Tunnelup::Client.new(api_key: flags.api_token)
        puts "Logged in as: #{client.get_current_user.email}"
      rescue Tunnelup::UnauthorizedError
        puts "Not currently logged in"
      end
    end
  end
end
