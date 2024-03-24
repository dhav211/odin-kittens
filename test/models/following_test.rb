# == Schema Information
#
# Table name: followings
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  kitten_id  :integer          not null
#  owner_id   :integer          not null
#
# Indexes
#
#  index_followings_on_kitten_id  (kitten_id)
#  index_followings_on_owner_id   (owner_id)
#
# Foreign Keys
#
#  kitten_id  (kitten_id => kittens.id)
#  owner_id   (owner_id => owners.id)
#
require "test_helper"

class FollowingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
