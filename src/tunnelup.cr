require "admiral"
require "http"
require "json"

require "./tunnelup/commands/*"
require "./tunnelup/models/*"
require "./tunnelup/*"

Tunnelup::Cli.run
