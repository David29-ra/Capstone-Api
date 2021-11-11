module Api
  class FavoritesController < ApplicationController
    def create
      @favorite = Favorite.new(favorite_params)
      @favorite.save ? (render json: @favorite) : (render json: @favorite.errors.messages)
    end

    def destroy
      @favorite = Favorite.find(params[:id])
      @favorite.destroy
    end

    private

    def favorite_params
      params.require(:favorite).permit(:user_id, :property_id)
    end
  end
end
