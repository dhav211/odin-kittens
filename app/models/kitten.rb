# == Schema Information
#
# Table name: kittens
#
#  id             :integer          not null, primary key
#  color          :string
#  date_of_birth  :datetime
#  gender         :string
#  name           :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  followers_id   :integer
#  image_posts_id :integer
#  main_image_id  :integer
#  owner_id       :integer
#
# Indexes
#
#  index_kittens_on_followers_id    (followers_id)
#  index_kittens_on_image_posts_id  (image_posts_id)
#
# Foreign Keys
#
#  followers_id    (followers_id => followers.id)
#  image_posts_id  (image_posts_id => image_posts.id)
#
class Kitten < ApplicationRecord
  belongs_to :owner
  has_many :image_posts
  has_many :followers, dependent: :destroy

  has_many :images, through: :image_posts, source: :image_attachment
  has_one_attached :profile_picture

  validate :acceptable_image

  def age
    (Time.now - date_of_birth) / 31_556_952
  end

  def acceptable_image
    errors.add(:title, 'must upload image') unless profile_picture.attached?
  end

  def main_image
    img = images.find_by(id: main_image_id)

    if images.empty?
      'no_image.png'
    elsif img.nil?
      images.first
    else
      img
    end
  end
end
