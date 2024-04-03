class AddLikesRefToImagePosts < ActiveRecord::Migration[7.1]
  def change
    add_reference :image_posts, :likes, null: true, foreign_key: true
  end
end
