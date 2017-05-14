module Tunnelup
  module Models
    class User
      JSON.mapping(
        id: String,
        email: String,
      )
    end
  end
end
