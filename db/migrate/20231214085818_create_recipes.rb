class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.integer :user_id
      t.string :title
      t.string :description
      t.string :image

      t.timestamps
    end
  end
end
