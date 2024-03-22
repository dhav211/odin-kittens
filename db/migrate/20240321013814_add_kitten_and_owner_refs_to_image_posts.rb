class AddKittenAndOwnerRefsToImagePosts < ActiveRecord::Migration[7.1]
  def change
    add_reference :image_posts, :kitten, null: false, foreign_key: true
    add_reference :image_posts, :owner, null: false, foreign_key: true
  end
end
