class Api::V1::TokensController < Api::AuthorizationController
  def index
    @tokens = Token.all

    unless token_params.blank?
      @tokens = @tokens.where(token_params)
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
end
