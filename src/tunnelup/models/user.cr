module Tunnelup
  module Models
    class User
      JSON.mapping(
        api_token: String,
        email: String,
        id: String,
      )
    end
  end
end
