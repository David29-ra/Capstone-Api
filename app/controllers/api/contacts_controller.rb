module Api
  class ContactsController < ApplicationController
    # POST /api/contacts
    def create
      @contact = Contact.new(contact_params)
      @contact.user_id = current_user.id
      @contact.save ? (render json: @contact) : (render json: @contact.errors.messages)
    end

    # DELETE /api/contacts/:id
    def destroy
      @contact = Contact.find(params[:id])
      if @contact.user_id == current_user.id
        (render json: { message: 'Property deleted' } if @contact.destroy)
      else
        (render json: { error: 'Unauthorized' })
      end
    end

    private

    def contact_params
      params.require(:contact).permit(:user_id, :property_id)
    end
  end
end
