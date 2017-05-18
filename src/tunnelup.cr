require "admiral"
require "http/client"
require "json"

require "./tunnelup/commands/*"
require "./tunnelup/models/*"
require "./tunnelup/*"

Tunnelup::Cli.run
