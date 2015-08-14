class Shelter < ActiveRecord::Base
  include Sluggable
  
  has_many :dogs

  default_scope -> { order(:name) }

end
