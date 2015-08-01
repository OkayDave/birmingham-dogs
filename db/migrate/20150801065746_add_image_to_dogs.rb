class AddImageToDogs < ActiveRecord::Migration
  def change
    add_column :dogs, :image_url, :string
  end
end
