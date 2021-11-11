module Api
  class PropertiesController < ApplicationController
    def index
      @properties = Property.all
      render json: @properties
    end
  end
end
