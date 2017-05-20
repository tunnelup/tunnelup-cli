module Tunnelup
  class UnauthorizedError < Exception; end

  class Client
    include ::Tunnelup::ApiHelpers

    getter :api_key

    def initialize(@api_key : String)
    end

    def self.login(email : String, password : String)
      json = {
        user: {
          email: email,
          password: password,
        }
      }

      response = HTTP::Client.post(
        url: "#{API_BASE}/sessions",
        headers: HTTP::Headers{
          "Content-Type" => "application/json",
        },
        body: json.to_json,
      )

      if response.status_code == 401
        raise Tunnelup::UnauthorizedError.new("Unauthorized API response")
      end

      Tunnelup::Models::User.from_json(response.body)
    end

    def self.signup(email : String, password : String)
      json = {
        user: {
          email: email,
          password: password,
        }
      }

      response = HTTP::Client.post(
        url: "#{API_BASE}/users",
        headers: HTTP::Headers{
          "Content-Type" => "application/json",
        },
        body: json.to_json,
      )

      if response.status_code == 401
        raise Tunnelup::UnauthorizedError.new("Unauthorized API response")
      end

      Tunnelup::Models::User.from_json(response.body)
    end

    def get_current_user
      response = get("/users/me")
      Tunnelup::Models::User.from_json(response.body)
    end

    def get_subdomains
      response = get("/subdomains")
      response.body
    end

    # def create_tunnel(opts : NamedTuple)
    #   json = post(path: "/tunnels", opts: opts)
    #
    #   Tunnelup::Tunnel.new(json: json)
    # end
  end
end
