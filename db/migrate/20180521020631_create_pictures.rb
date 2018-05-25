class CreatePictures < ActiveRecord::Migration[5.1]
  def change
    create_table :pictures do |t|
      t.string :description
      t.string :image
      t.integer :post_id

      t.timestamps
 
    end
  end
end
