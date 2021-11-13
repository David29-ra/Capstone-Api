class PropertySerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :user_id, :address, :price, :area, :beds, :baths,
             :description, :status, :property_type, :operation_type,
             :photo

  def photo
    return unless object.photo.attached?

    { url: rails_blob_url(object.photo) }
  end
end
