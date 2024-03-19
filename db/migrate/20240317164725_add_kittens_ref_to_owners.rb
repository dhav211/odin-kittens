class AddKittensRefToOwners < ActiveRecord::Migration[7.1]
  def change
    add_reference :owners, :kittens, null: true, foreign_key: true
  end
end
