require 'jwt'

module AuthToken
  def AuthToken.issue_token(payload)
    # Set expiration to 24 hours.
    JWT.encode(payload, "secret")
  end

  def AuthToken.valid?(token)
    begin
      JWT.decode(token, "secret")
    rescue
      false
    end
  end
end