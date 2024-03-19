class AddOwnerIdToKittens < ActiveRecord::Migration[7.1]
  def change
    add_column :kittens, :owner_id, :integer
  end
end
