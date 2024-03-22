class AddBodyToImagePosts < ActiveRecord::Migration[7.1]
  def change
    add_column :image_posts, :body, :text
  end
end
