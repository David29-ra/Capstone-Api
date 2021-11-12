module Api
  class UsersController < ApplicationController
    skip_before_action :authorize_token, only: :create

    # POST /api/signup
    def create
      @user = User.new(user_params)
      @user.password = params[:password]
      @user.save ? (render json: @user) : (render json: @user.errors.messages)
    end

    private

    def user_params
      params.require(:user).permit(:email, :password, :name, :phone, :role)
    end
  end
end
