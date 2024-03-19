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
require "test_helper"

class KittenTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
