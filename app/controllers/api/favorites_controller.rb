module Api
  class FavoritesController < ApplicationController
    # Post /api/favorite
    def create
      @favorite = Favorite.new(favorite_params)
      @favorite.user_id = current_user.id
      @favorite.save ? (render json: @favorite) : (render json: @favorite.errors.messages)
    end

    # DELETE /api/favorite/:id
    def destroy
      @favorite = Favorite.find(params[:id])
      if @favorite.user_id == current_user.id
        (render json: { message: 'Property deleted' } if @favorite.destroy)
      else
        (render json: { error: 'Unauthorized' })
      end
    end

    private

    def favorite_params
      params.require(:favorite).permit(:user_id, :property_id)
    end
  end
end
