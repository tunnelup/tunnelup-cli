module Tunnelup
  module Models
    class Tunnel
      getter :local_host
      getter :local_port
      getter :remote_host
      getter :remote_port

      def initialize(json); end
    end
  end
end
