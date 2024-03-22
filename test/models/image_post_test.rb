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
require "test_helper"

class ImagePostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
