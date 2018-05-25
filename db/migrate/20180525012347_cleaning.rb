class Cleaning < ActiveRecord::Migration[5.1]
  def change
  	remove_column :users, :avatar_file_name
  	remove_column :users, :avatar_content_type
  	remove_column :users, :avatar_file_size
  	remove_column :users, :avatar_updated_at
  	remove_column :posts, :category_id
  	remove_column :posts, :token
  	add_column :users, :avatar_data , :text

  end
end