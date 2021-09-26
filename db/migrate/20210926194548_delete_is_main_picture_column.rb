class DeleteIsMainPictureColumn < ActiveRecord::Migration[6.1]
  def change
    remove_column :pictures, :is_main_picture
  end
end
