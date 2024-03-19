class CreateImagePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :image_posts do |t|
      t.integer :media_id
      t.text :body
      t.belongs_to :kitten, null: false, foreign_key: true
      t.belongs_to :owner, null: false, foreign_key: true

      t.timestamps
    end
  end
end
