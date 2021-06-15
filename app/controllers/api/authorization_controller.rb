class Api::AuthorizationController < ApplicationController
  before_action :verify_authenticity

  def verify_authenticity
    return render json: { error: 'Invalid Token!', status: 401 } unless verify_token
  end

  private

  def verify_token
    request.headers['HTTP_AUTH_TOKEN'].to_s == ENV['AUTH_TOKEN'].to_s
  end
end
