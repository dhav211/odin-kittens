# == Schema Information
#
# Table name: kittens
#
#  id         :integer          not null, primary key
#  age        :integer
#  cuteness   :integer
#  image_url  :string
#  name       :string
#  softness   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Kitten < ApplicationRecord
end
