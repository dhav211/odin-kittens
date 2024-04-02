class RemoveAgeFromKittens < ActiveRecord::Migration[7.1]
  def change
    remove_column :kittens, :age
  end
end
