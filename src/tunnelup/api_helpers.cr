module Tunnelup
  module ApiHelpers
    API_BASE = "https://tunnelup.com/api/v1"

    def url_from_path(path : String)
      "#{API_BASE}#{path}"
    end

    def post(path : String, opts : NamedTuple)
      response = HTTP::Client.post(
        url: url_from_path(path),
        headers: default_headers,
      )

      JSON.parse(response.body)
    end

    def get(path : String)
      response = HTTP::Client.get(
        url: url_from_path(path),
        headers: default_headers,
      )

      if response.status_code == 401
        raise Tunnelup::UnauthorizedError.new("Unauthorized API response")
      end

      response
    end

    def default_headers
      HTTP::Headers{
        "User-Agent" => "tunnelup-cli",
        "Authorization" => "Token token=#{api_key}"
      }
    end
  end
end
