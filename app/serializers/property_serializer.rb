class PropertySerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :user_id, :address, :price, :area, :beds, :baths,
             :description, :status, :property_type, :operation_type,
             :pets, :photo

  def photo
    return unless object.photo.attached?

    { url: rails_blob_path(object.photo, only_path: true) }
  end
end
