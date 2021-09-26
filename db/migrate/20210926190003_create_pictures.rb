class CreatePictures < ActiveRecord::Migration[6.1]
  def change
    create_table :pictures do |t|
      t.string :title
      t.string :subtitle
      t.string :image_url
      t.integer :width
      t.integer :height
      t.float :ratio
      t.integer :red_value
      t.integer :green_value
      t.integer :blue_value
      t.boolean :is_main_picture

      t.timestamps
    end
  end
end
