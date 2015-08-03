class Breed < ActiveRecord::Base
  has_many :dogs

  default_scope -> { order(:name) }

  def dog_image_url
    return self.image_url unless self.image_url.blank?

    if self.dogs.count > 0
      self.image_url = self.dogs.first.image_url
      self.save
      return self.image_url
    else
      return ""
    end


  end

end
