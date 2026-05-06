# frozen_string_literal: true

class CreateRecipes < ActiveRecord::Migration[8.1]
  def change
    create_table :recipes, id: :string do |t|
      t.string :title, null: false
      t.text :description
      t.string :image
      t.string :chef_name
      t.json :tags_list
    end
  end
end
