class Shrine1 < ActiveRecord::Migration[5.1]
  def change
  	remove_column :pictures, :post_token
  	remove_column :pictures, :image_file_name
  	remove_column :pictures, :image_content_type
  	remove_column :pictures, :image_file_size
  	remove_column :pictures, :image_updated_at
  	add_column :pictures, :image_data, :text
  	add_index :pictures, :post_id
  end
end