require "admiral"

class Tunnelup::Cli < Admiral::Command
  class Authorize < Admiral::Command
    def run
      puts "Authorizing"
    end
  end
  register_sub_command "hi", Authorize

  define_argument port, default: 8080

  define_help description: "A command that says hello"

  define_version Tunnelup::VERSION

  define_flag host : String, default: "localhost", description: "Verbose output mode"
  define_flag port : Int32, default: 3000, description: "Local port"

  def run
    # client = Tunnelup::Client.new(api_key: "Hello")
    # client.create_tunnel(opts: {
    #   local: "yes"
    # })
  end
end
