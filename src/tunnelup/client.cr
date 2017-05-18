module Tunnelup
  class UnauthorizedError < Exception; end

  class Client
    API_BASE = "https://tunnelup.com/api/v1"

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

    private def url_from_path(path : String)
      "#{API_BASE}#{path}"
    end

    private def post(path : String, opts : NamedTuple)
      response = HTTP::Client.post(
        url: url_from_path(path),
        headers: default_headers,
      )

      JSON.parse(response.body)
    end

    private def get(path : String)
      response = HTTP::Client.get(
        url: url_from_path(path),
        headers: default_headers,
      )

      if response.status_code == 401
        raise Tunnelup::UnauthorizedError.new("Unauthorized API response")
      end

      response
    end

    private def default_headers
      HTTP::Headers{
        "User-Agent" => "tunnelup-cli",
        "Authorization" => "Token token=#{api_key}"
      }
    end
  end
end
