class AddSlugs < ActiveRecord::Migration
  def change
    add_column :dogs, :slug, :string
    add_column :breeds, :slug, :string
    add_column :shelters, :slug, :string

    add_index :dogs, :slug
    add_index :breeds, :slug
    add_index :shelters, :slug
  end
end
