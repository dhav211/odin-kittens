# == Schema Information
#
# Table name: kittens
#
#  id         :integer          not null, primary key
#  age        :integer
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Kitten < ApplicationRecord
  has_one_attached :main_image
  has_many_attached :images
end
