class Tunnelup::Cli < Admiral::Command
  register_sub_command "whoami", ::Tunnelup::Commands::Whoami
  register_sub_command "login",  ::Tunnelup::Commands::Login
  register_sub_command "signup",  ::Tunnelup::Commands::Signup

  define_argument port, default: 8080

  define_help description: "A command that says hello"

  define_version Tunnelup::VERSION

  define_flag host : String, default: "localhost", description: "Verbose output mode"
  define_flag port : Int32, default: 3000, description: "Local port"

  def run
    # user = Tunnelup::Client.login(email: "georgedrummond@gmail.com", password: "password")
    # puts user.to_json
  end
end
