class EncodeBase64CharacterService
  def initialize
  end

  def encode_characters(value)
    encode_value = value

    encode_value.gsub!('/', '_') if encode_value.include?('/')
    encode_value.gsub!('=', '-') if encode_value.include?('=')
    encode_value.gsub!('+', '.') if encode_value.include?('+')

    return encode_value
  end
end
