class Dog < ActiveRecord::Base
  include Sluggable

  belongs_to :shelter
  belongs_to :breed

  validates :name, :shelter_url, :image_url, :description, :breed, :shelter, presence: true

end
