class AddDataToDogs < ActiveRecord::Migration
  def change
    add_column :dogs, :reference, :string
    add_column :dogs, :size, :string
    add_column :dogs, :age_string, :string
    add_column :dogs, :home_tested, :string
    add_column :dogs, :child_friendly, :string
    add_column :dogs, :status, :string
    add_column :dogs, :date_added, :date
    add_column :dogs, :shelter_url, :string
  end
end
