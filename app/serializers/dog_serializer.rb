class DogSerializer < ActiveModel::Serializer

  attributes  :id, 
              :name, 
              :is_female, 
              :description,
              :image_url,
              :reference,
              :size,
              :age_string,
              :home_tested,
              :child_friendly,
              :status,
              :date_added,
              :shelter_url,
              :slug

  belongs_to :breed
  belongs_to :shelter

  url :dog

end
