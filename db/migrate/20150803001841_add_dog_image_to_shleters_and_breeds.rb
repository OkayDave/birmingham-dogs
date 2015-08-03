class AddDogImageToShletersAndBreeds < ActiveRecord::Migration
  def change
    add_column :shelters, :image_url, :string
    add_column :breeds, :image_url, :string
  end
end
