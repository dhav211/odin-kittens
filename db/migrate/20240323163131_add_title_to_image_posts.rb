class AddTitleToImagePosts < ActiveRecord::Migration[7.1]
  def change
    add_column :image_posts, :title, :string
  end
end
