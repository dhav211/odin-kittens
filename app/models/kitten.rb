# == Schema Information
#
# Table name: kittens
#
#  id                 :bigint           not null, primary key
#  color              :string
#  date_of_birth      :datetime
#  gender             :string
#  name               :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  followers_id       :integer
#  image_posts_id     :integer
#  owner_id           :integer
#  profile_picture_id :integer
#
# Indexes
#
#  index_kittens_on_followers_id    (followers_id)
#  index_kittens_on_image_posts_id  (image_posts_id)
#
# Foreign Keys
#
#  fk_rails_...  (followers_id => followers.id)
#  fk_rails_...  (image_posts_id => image_posts.id)
#
class Kitten < ApplicationRecord
  belongs_to :owner
  has_many :image_posts
  has_many :followers, dependent: :destroy

  has_many :images, through: :image_posts, source: :image_attachment

  GENDERS = ['Male', 'Female', 'Not Sure'].freeze
  COLORS = ['White', 'Black', 'Black And White', 'Tabby', 'Ginger', 'Grey'].freeze

  validates :name, presence: true
  validates :date_of_birth, presence: true
  validates :gender, presence: true
  validates :gender, inclusion: { in: GENDERS, message: '%{value} is not a valid gender choice' }
  validates :color, presence: true
  validates :color, inclusion: { in: COLORS, message: '%{value} is not a valid color' }

  # Get the number of years the kitten has been alive
  def age
    (Time.now - date_of_birth) / 31_556_952
  end

  def profile_picture
    images.find profile_picture_id
  end

  def acceptable_image
    errors.add(:profile_picture, 'must be uploaded') unless profile_picture.attached?
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

  def profile_picture_selected?(picture_id)
    profile_picture_id == picture_id
  end
end
