class AddDescriptionToComments < ActiveRecord::Migration
  def change
    add_column :comments, :description, :string
    add_column :comments, :post_id, :integer
  end
end
