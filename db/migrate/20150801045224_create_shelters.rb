class CreateShelters < ActiveRecord::Migration
  def change
    create_table :shelters do |t|
      t.string :name, null: false
      t.text   :description, null: false
      t.text   :contact_details
      t.string :url
      t.timestamps null: false
    end
  end
end
