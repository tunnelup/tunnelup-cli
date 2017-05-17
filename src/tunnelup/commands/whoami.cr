module Tunnelup
  module Commands
    class Whoami < ::Admiral::Command
      define_help description: "Outputs the current user logged in"

      def run
        client = Tunnelup::Client.new(api_key: "d3pGjwdEysqhj81kgWDEi9nq")
        puts "\nLogged in as: #{client.get_current_user.email}\n"
      end
    end
  end
end
