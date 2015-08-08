class ShelterSerializer < ActiveModel::Serializer
  attributes  :id,
              :name,
              :description,
              :contact_details,
              :url,
              :image_url,
              :slug

  has_many :dogs

end
