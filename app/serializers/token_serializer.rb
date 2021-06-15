class TokenSerializer < ActiveModel::Serializer
  def hash_token
    return EncodeBase64CharacterService.new.encode_characters(object.hash_token)
  end
  
  attributes :hash_token, :responsible
end
