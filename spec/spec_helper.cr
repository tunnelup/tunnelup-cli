require "spec"
require "secure_random"
require "webmock"

require "../src/tunnelup"

module FakeApi
  extend self

  def client
    Tunnelup::Client.new(api_key: SecureRandom.hex)
  end

  def stub_api_login_success
    json = %(
      {
        "api_token": "random",
        "email": "georgedrummond@gmail.com",
        "id": "1234"
      }
    )

    WebMock.stub(:post, "https://tunnelup.com/api/v1/sessions")
      .to_return(body: json, status: 201)
  end

  def stub_api_get_user_success
    json = %(
      {
        "api_token": "random",
        "email": "georgedrummond@gmail.com",
        "id": "1234"
      }
    )

    WebMock.stub(:get, "https://tunnelup.com/api/v1/users/me")
      .to_return(body: json, status: 200)
  end

  def stub_api_get_user_unauthorized
    WebMock.stub(:get, "https://tunnelup.com/api/v1/users/me")
      .to_return(body: "Unauthorized", status: 401)
  end

  def stub_api_get_subdomains_unauthorized
    WebMock.stub(:get, "https://tunnelup.com/api/v1/subdomains")
      .to_return(body: "Unauthorized", status: 401)
  end

  def webmock_reset
    WebMock.reset
  end
end

Spec.after_each do
  FakeApi.webmock_reset
end
