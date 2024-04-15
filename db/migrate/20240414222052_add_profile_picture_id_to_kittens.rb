class AddProfilePictureIdToKittens < ActiveRecord::Migration[7.1]
  def change
    add_column :kittens, :profile_picture_id, :integer
  end
end
