class CreateKittens < ActiveRecord::Migration[7.1]
  def change
    create_table :kittens do |t|
      t.string :name
      t.integer :age
      t.integer :cuteness
      t.integer :softness
      t.string :image_url

      t.timestamps
    end
  end
end
