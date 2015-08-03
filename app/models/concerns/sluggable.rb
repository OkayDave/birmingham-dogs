module Sluggable
  extend ActiveSupport::Concern

  included do
    before_save :_generate_slug
  end

  def _generate_slug
    if self.slug.blank?
      self.slug = "#{self.name} #{self.id}" .gsub(" ","-").gsub(".","")
    end
  end

  def to_param
    return self.slug unless self.slug.blank?
    return self.id.to_s
  end

  module ClassMethods
    def find(id)
      puts id.class
      if !id.respond_to?(:is_numeric?) || id.is_numeric?
        super(id)
      else
        find_by_slug(id)
      end
    end
  end
end
