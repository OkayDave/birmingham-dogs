require 'rails_helper'

RSpec.describe Dog, type: :model do
  it_behaves_like "sluggable"
end
