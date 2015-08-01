class CreateDogs < ActiveRecord::Migration
  def change
    create_table :dogs do |t|
      t.integer :shelter_id, null: false
      t.string  :name, null: false
      t.boolean  :is_female, default: true 
      t.text    :description
      t.integer :breed_id, null: false
      t.date    :date_of_birth
      t.timestamps null: false
    end

    add_index :dogs, :shelter_id
    add_index :dogs, :is_female
    add_index :dogs, :breed_id
  end
end
