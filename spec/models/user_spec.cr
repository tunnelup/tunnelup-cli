require "./../spec_helper"

describe Tunnelup::Models::User do
  describe ".from_json" do
    it "sets api_token, email, and id" do
      user = Tunnelup::Models::User.from_json(%(
        {
          "api_token": "random",
          "email": "georgedrummond@gmail.com",
          "id": "1234"
        }
      ))

      user.api_token.should_not be_nil
      user.email.should_not be_nil
      user.id.should_not be_nil
    end
  end
end
