class RemoveMediaIdFromImagePosts < ActiveRecord::Migration[7.1]
  def change
    remove_column :image_posts, :media_id
  end
end
