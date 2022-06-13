class CreateCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :categories do |t|
      t.string :category_title
      t.string :category_details

      t.timestamps
    end
  end
end
