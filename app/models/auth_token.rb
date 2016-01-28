require 'date'
class AuthToken

  def self.encode(payload)#, exp=24.hours.from_now)
    #payload[:exp] = (Date.today + 30).to_time.to_i
    #TODO cambiar la llave secreta
    secret = Rails.application.secrets.secret_key_base
    JWT.encode payload, secret, 'HS256'
  end

  def self.decode(token)
    secret = Rails.application.secrets.secret_key_base
    payload = JWT.decode(token, secret, true, { :algorithm => 'HS256' } )
    puts "decodificando #{payload} "
    DecodedAuthToken.new(payload)
    
  rescue
    nil # It will raise an error if it is not a token that was generated with our secret key or if the user changes the contents of the payload
  end
end

# We could just return the payload as a hash, but having keys with indifferent access is always nice, plus we get an expired? method that will be useful later
class DecodedAuthToken < HashWithIndifferentAccess
  def expired?
		self[:exp] <= Time.now.to_i
  end
end

class NotAuthenticatedError < StandardError
end


class AuthenticationTimeoutError < StandardError
end

class AccessDeniedError < StandardError
end
