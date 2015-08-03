class Dog < ActiveRecord::Base
  include Sluggable

  belongs_to :shelter
  belongs_to :breed


end
