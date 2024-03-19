class AddPostImageRefToKittens < ActiveRecord::Migration[7.1]
  def change
    add_reference :kittens, :image_posts, null: true, foreign_key: true
  end
end
