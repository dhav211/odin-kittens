class AddDobColorGenderToKittens < ActiveRecord::Migration[7.1]
  def change
    add_column :kittens, :date_of_birth, :datetime
    add_column :kittens, :color, :string
    add_column :kittens, :gender, :string
  end
end
