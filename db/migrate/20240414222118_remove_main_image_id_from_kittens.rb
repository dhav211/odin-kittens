class RemoveMainImageIdFromKittens < ActiveRecord::Migration[7.1]
  def change
    remove_column :kittens, :main_image_id
  end
end
