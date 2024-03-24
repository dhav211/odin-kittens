class AddFollowersToKittens < ActiveRecord::Migration[7.1]
  def change
    add_reference :kittens, :followers, null: true, foreign_key: true
  end
end
