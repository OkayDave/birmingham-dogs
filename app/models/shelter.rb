class Shelter < ActiveRecord::Base
  has_many :dogs

  default_scope -> { order(:name) }



end
