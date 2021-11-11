module Api
  class UsersController < ApplicationController
    def new
      render json: {}
    end

    # private

    # def user_params
    #   params.require(:user).permit(:email, :password)
    # end
  end
end
