# == Schema Information
#
# Table name: likes
#
#  id            :bigint           not null, primary key
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  image_post_id :bigint           not null
#  owner_id      :bigint           not null
#
# Indexes
#
#  index_likes_on_image_post_id  (image_post_id)
#  index_likes_on_owner_id       (owner_id)
#
# Foreign Keys
#
#  fk_rails_...  (image_post_id => image_posts.id)
#  fk_rails_...  (owner_id => owners.id)
#
class Like < ApplicationRecord
  belongs_to :image_post
  belongs_to :owner
end
