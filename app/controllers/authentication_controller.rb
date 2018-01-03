class AuthenticationController < ApplicationController

  def authenticate
    command = ClientAuthentication.call(params[:name], params[:password])
    if command.success?
      render json: { auth_token: command.result }
    else
      render json: { error: command.errors }, status: :unauthorized
    end
  end
end