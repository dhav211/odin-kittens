# == Schema Information
#
# Table name: kittens
#
#  id             :integer          not null, primary key
#  age            :integer
#  name           :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  image_posts_id :integer
#  main_image_id  :integer
#  owner_id       :integer
#
# Indexes
#
#  index_kittens_on_image_posts_id  (image_posts_id)
#
# Foreign Keys
#
#  image_posts_id  (image_posts_id => image_posts.id)
#
class Kitten < ApplicationRecord
  belongs_to :owner
  has_many :image_posts

  has_many :images, through: :image_posts, source: :image_attachment

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
