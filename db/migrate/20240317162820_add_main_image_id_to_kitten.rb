class AddMainImageIdToKitten < ActiveRecord::Migration[7.1]
  def change
    add_column :kittens, :main_image_id, :integer
  end
end
