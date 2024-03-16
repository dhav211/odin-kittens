class RemoveColumnsFromKitten < ActiveRecord::Migration[7.1]
  def change
    remove_column :kittens, :cuteness
    remove_column :kittens, :softness
    remove_column :kittens, :image_url
  end
end
