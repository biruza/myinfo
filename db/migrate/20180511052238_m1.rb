class M1 < ActiveRecord::Migration[5.1]
  def up
  change_column :posts, :categories, :text
end
def down
  # This might cause trouble if you have strings longer
  # than 255 characters.
  change_column :posts, :categories, :string
end
end
