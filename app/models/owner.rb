# == Schema Information
#
# Table name: owners
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  username               :string
#  kittens_id             :integer
#
# Indexes
#
#  index_owners_on_email                 (email) UNIQUE
#  index_owners_on_kittens_id            (kittens_id)
#  index_owners_on_reset_password_token  (reset_password_token) UNIQUE
#
# Foreign Keys
#
#  kittens_id  (kittens_id => kittens.id)
#
class Owner < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :kittens
  has_many :followings, dependent: :destroy, class_name: 'Follower'

  validates :username, uniqueness: true
  validates :email, uniqueness: true
  validates :password, presence: true

  def email_required?
    false
  end

  def email_changed?
    false
  end

  # use this instead of email_changed? for Rails = 5.1.x
  def will_save_change_to_email?
    false
  end
end
