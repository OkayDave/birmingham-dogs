module Sluggable
  extend ActiveSupport::Concern

  included do
    after_create :generate_slug
  end

  def generate_slug
    if self.slug.blank?
      self.slug = "#{self.name} #{self.id unless self.is_a?(Shelter)}".parameterize
      self.save
    end

  end

  def to_param
    return self.slug unless self.slug.blank?
    return self.id.to_s
  end

  module ClassMethods
    def find(id)
      if id.is_numeric?
        super(id)
      else
        found = find_by_slug(id)
        if found.nil?
          raise ActiveRecord::RecordNotFound
        else
          return found
        end
      end
    end
  end
end
