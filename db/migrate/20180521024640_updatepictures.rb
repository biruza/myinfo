class Updatepictures < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :token, :string
    add_column :pictures, :post_token, :string
  end
   def self.up
    change_table :pictures do |t|
      t.attachment :image
    end
  end

  def self.down
    drop_attached_file :pictures, :image
  end
end
