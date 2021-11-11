module Api
  class ContactsController < ApplicationController
    def create
      @contact = Contact.new(contact_params)
      @contact.save ? (render json: @contact) : (render json: @contact.errors.messages)
    end

    def destroy
      @contact = Contact.find(params[:id])
      @contact.destroy
    end

    private

    def contact_params
      params.require(:contact).permit(:user_id, :property_id)
    end
  end
end
