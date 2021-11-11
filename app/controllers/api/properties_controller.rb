module Api
  class PropertiesController < ApplicationController
    def index
      @properties = Property.all
      render json: @properties
    end

    def create
      @property = Property.new(property_params)
      @property.save ? (render json: @property) : (render json: @property.errors.messages)
    end

    private

    def property_params
      params.require(:property).permit(:user_id, :address, :price, :area, :beds, :baths,
                                       :description, :status, :property_type, :operation_type,
                                       :photo)
    end
  end
end
