class CreatePictures2 < ActiveRecord::Migration[5.1]
  def change
     add_column :pictures, :description, :string
      add_column :pictures, :image, :string
      add_column :pictures, :post_id, :integer
  end
end
