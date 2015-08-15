require 'rails_helper'

RSpec.describe Shelter, type: :model do
  it_behaves_like "sluggable"
end
