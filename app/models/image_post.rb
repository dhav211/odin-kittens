# == Schema Information
#
# Table name: image_posts
#
#  id        :bigint           not null, primary key
#  body      :text
#  title     :string
#  kitten_id :integer          not null
#  likes_id  :bigint
#  owner_id  :integer          not null
#
# Indexes
#
#  index_image_posts_on_kitten_id  (kitten_id)
#  index_image_posts_on_likes_id   (likes_id)
#  index_image_posts_on_owner_id   (owner_id)
#
# Foreign Keys
#
#  fk_rails_...  (kitten_id => kittens.id)
#  fk_rails_...  (likes_id => likes.id)
#  fk_rails_...  (owner_id => owners.id)
#
class ImagePost < ApplicationRecord
  belongs_to :kitten
  belongs_to :owner
  has_one_attached :image
  has_many :likes, dependent: :destroy

  validate :acceptable_image

  scope :next, ->(post) { post.kitten.image_posts.where('id > ?', post.id).first }
  scope :previous, ->(post) { post.kitten.image_posts.where('id < ?', post.id).last }

  def acceptable_image
    errors.add(:title, 'must upload image') unless image.attached?
  end

  def first?(kitten)
    kitten.image_posts.first.id == id
  end

  def last?(kitten)
    kitten.image_posts.last.id == id
  end
end
