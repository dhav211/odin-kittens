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
require "test_helper"

class KittenTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
