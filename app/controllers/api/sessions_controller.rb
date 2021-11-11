module Api
  class SessionsController < ApplicationController
    skip_before_action :authorize_token, only: :create

    # POST /api/login
    def create
      user = User.find_by(email: params[:email])
      
      if user&.valid_password?(params[:password])
        user.regenerate_token
        render json: { token: user.token,
                      email: user.email, 
                      name: user.name, 
                      phone: user.phone,
                      favorites: user.favorites,
                      contacts: user.contacts,
                      properties: user.properties
                      }
      else
        unauthorized_request 'Invalid user credentials'
      end
    end

    # POST /api/logout
    def destroy
      current_user.invalidate_token
      head :no_content
    end

    private

    def user_params
      params.require(:user).permit(:email, :password)
    end
  end
end
