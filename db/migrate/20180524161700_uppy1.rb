class Uppy1 < ActiveRecord::Migration[5.1]
  def change
  	remove_column :posts, :image_file_name
  	remove_column :posts, :image_content_type
  	remove_column :posts, :image_file_size
  	remove_column :posts, :image_updated_at
  	add_column :posts, :cover_photo_data , :text
  end
end
