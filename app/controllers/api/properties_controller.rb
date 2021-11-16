module Api
  class PropertiesController < ApplicationController
    # GET /api/properties
    def index
      @properties = Property.all

      render json: @properties
    end

    # Post /api/properties
    def create
      if current_user.landlord?
        @property = Property.new(property_params)
        @property.user_id = current_user.id
        @property.save ? (render json: @property) : (render json: @property.errors.messages)
      else
        render json: { error: 'You are not authorized to create a property' }
      end
    end

    # PATCH /api/properties/:id
    def update
      return unless current_user.landlord?

      @property = Property.find(params[:id])

      return unless @property.user_id == current_user.id

      if @property.update(property_params)
        (render json: @property)
      else
        (render json: @property.errors.messages)
      end
    end

    # DELETE /api/properties/:id
    def destroy
      if current_user.landlord?
        @property = Property.find(params[:id])
        if @property.user_id == current_user.id
          (render json: { message: 'Property deleted' } if @property.destroy)
        else
          (render json: { error: 'You are not authorized to delete this property' })
        end
      else
        render json: { error: "You can't" }
      end
    end

    private

    def property_params
      params.require(:property).permit(:user_id, :address, :price, :area, :beds, :baths,
                                       :description, :status, :pets, :maintenance, :property_type,
                                       :operation_type, :photo)
    end
  end
end
