# == Schema Information
#
# Table name: followers
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  kitten_id  :integer          not null
#  owner_id   :integer          not null
#
# Indexes
#
#  index_followers_on_kitten_id  (kitten_id)
#  index_followers_on_owner_id   (owner_id)
#
# Foreign Keys
#
#  kitten_id  (kitten_id => kittens.id)
#  owner_id   (owner_id => owners.id)
#
class Follower < ApplicationRecord
  belongs_to :kitten
  belongs_to :owner
end
