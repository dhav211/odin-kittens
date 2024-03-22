# == Schema Information
#
# Table name: image_posts
#
#  id        :integer          not null, primary key
#  body      :text
#  kitten_id :integer          not null
#  owner_id  :integer          not null
#
# Indexes
#
#  index_image_posts_on_kitten_id  (kitten_id)
#  index_image_posts_on_owner_id   (owner_id)
#
# Foreign Keys
#
#  kitten_id  (kitten_id => kittens.id)
#  owner_id   (owner_id => owners.id)
#
class ImagePost < ApplicationRecord
  belongs_to :kitten
  belongs_to :owner
  has_one_attached :image

  validate :acceptable_image

  def acceptable_image
    errors.add(:title, 'must upload image') unless image.attached?
  end
end
