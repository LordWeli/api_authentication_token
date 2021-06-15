class Api::V1::TokensController < Api::AuthorizationController
  def index
    @tokens = Token.all

    unless token_params.blank?
      @tokens = @tokens.where(convert_params(token_params))
    end

    render json: @tokens
  end

  def create
    @token = Token.new(token_params)

    @token.hash_token = TokenService.new.create

    if @token.save
      render json: @token
    else
      render json: { errors: @token.errors.full_messages }, status: 422
    end
  end

  private

  def token_params
    return [] if params[:token].blank?

    params.require(:token).permit(:responsible, :hash_token)
  end

  def convert_params(value)
    if value[:hash_token].nil?
      return value
    else
      hash_value = { hash_token: DecodeBase64CharacterService.new.decode_characters(value[:hash_token]) }
      hash_value[:responsible] = value[:responsible] unless value[:responsible].nil?

      return hash_value
    end

  end
end
