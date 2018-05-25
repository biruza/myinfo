class Uppy2 < ActiveRecord::Migration[5.1]
  def change
  	remove_column :pictures, :description
  	add_column :pictures, :title , :string
  end
end
