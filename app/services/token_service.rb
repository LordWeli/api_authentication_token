class TokenService
  def initialize(value = ENV.fetch('TOKEN_VALUE', 32).to_i)
    @value = value
  end

  def create
    SecureRandom.base64(@value)
  end
end
