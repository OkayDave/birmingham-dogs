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

  has_one :breed
  has_one :shelter


end
