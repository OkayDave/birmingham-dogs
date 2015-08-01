class Dog < ActiveRecord::Base
  belongs_to :shelter
  belongs_to :breed
end
