bubbles = Owner.create(username: 'bubbles', email: 'dhav211@gmail.com', password: 'password')

bubbles.kittens << Kitten.create(
  name: 'Pickles',
  date_of_birth: DateTime.new(2018, 1, 1),
  color: 'Black And White',
  gender: 'Female',
  profile_picture: { 
    io: File.open("#{Rails.root}/app/assets/images/christmas_pickles.jpg"),
    filename: 'christmas_pickles.jpg'
  }
)

pickles = bubbles.kittens.first

pickles.image_posts << ImagePost.create(
  title: 'Christmas Pickles',
  body: 'Is it christmas yet!?',
  image: { io: File.open("#{Rails.root}/app/assets/images/christmas_pickles.jpg"), filename: 'christmas_pickles.jpg' },
  owner: bubbles
)

pickles.image_posts << ImagePost.create(
  title: 'Amazed Cat',
  body: 'Kitty is getting her mind blown!',
  image: { io: File.open("#{Rails.root}/app/assets/images/amazed_cat.jpg"), filename: 'amazed_cat.jpg' },
  owner: bubbles
)

cat_master = Owner.create(username: 'cat_master', email: 'cat_master@email.com', password: 'password')

cat_master.kittens << Kitten.create(
  name: 'Fluffy',
  date_of_birth: DateTime.new(2017, 5, 1),
  color: 'Grey',
  gender: 'Female',
  profile_picture: {
    io: File.open("#{Rails.root}/app/assets/images/blanket.jpg"),
    filename: 'blanket.jpg'
  }
)

fluffy = cat_master.kittens.first

fluffy.followers << Follower.create(owner: bubbles)

fluffy.image_posts << ImagePost.create(
  title: 'Lazy Days',
  body: 'Just chiling on the bed enjoying the day.',
  image: { io: File.open("#{Rails.root}/app/assets/images/blanket.jpg"), filename: 'blanket.jpg' },
  owner: cat_master
)

fluffy.image_posts << ImagePost.create(
  title: 'My New Necklace',
  body: 'Drippin\' with my new necklace',
  image: { io: File.open("#{Rails.root}/app/assets/images/necklace.jpg"), filename: 'necklace.jpg' },
  owner: cat_master
)

fluffy.image_posts << ImagePost.create(
  title: 'New selfie',
  image: { io: File.open("#{Rails.root}/app/assets/images/fluffy.jpg"), filename: 'fluffy.jpg' },
  owner: cat_master
)

mongoosebelong = Owner.create(username: 'mongoosebelong', email: 'mongoosebelong@email.com', password: 'password')

mongoosebelong.kittens << Kitten.create(
  name: 'Tommy',
  date_of_birth: DateTime.new(2016, 3, 8),
  color: 'Ginger',
  gender: 'Male',
  profile_picture: {
    io: File.open("#{Rails.root}/app/assets/images/table_cat.jpg"),
    filename: 'table_cat.jpg'
  }
)

tommy = mongoosebelong.kittens.first

tommy.followers << Follower.create(owner: bubbles)

tommy.image_posts << ImagePost.create(
  title: 'On The Table!?',
  image: { io: File.open("#{Rails.root}/app/assets/images/table_cat.jpg"), filename: 'table_cat.jpg' },
  owner: mongoosebelong
)

tommy.image_posts << ImagePost.create(
  image: { io: File.open("#{Rails.root}/app/assets/images/tommy1.jpg"), filename: 'tommy1.jpg' },
  owner: mongoosebelong
)

tommy.image_posts << ImagePost.create(
  image: { io: File.open("#{Rails.root}/app/assets/images/tommy2.jpg"), filename: 'tommy2.jpg' },
  owner: mongoosebelong
)

tommy.image_posts << ImagePost.create(
  image: { io: File.open("#{Rails.root}/app/assets/images/tommy3.jpg"), filename: 'tommy3.jpg' },
  owner: mongoosebelong
)

tommy.image_posts << ImagePost.create(
  title: 'Best Time of the Year',
  image: { io: File.open("#{Rails.root}/app/assets/images/tommy4.jpg"), filename: 'tommy4.jpg' },
  owner: mongoosebelong
)

tommy.image_posts << ImagePost.create(
  title: 'Mr. Elegant',
  image: { io: File.open("#{Rails.root}/app/assets/images/tommy5.jpg"), filename: 'tommy5.jpg' },
  owner: mongoosebelong
)

threatenedcheesesteak = Owner.create(username: 'threatenedcheesesteak', email: 'threatenedcheesesteak@email.com', password: 'password')

threatenedcheesesteak.kittens << Kitten.create(
  name: 'Whiskers',
  date_of_birth: DateTime.new(2019, 1, 1),
  color: 'Tabby',
  gender: 'Male',
  profile_picture: { 
    io: File.open("#{Rails.root}/app/assets/images/yoohoo.jpg"),
    filename: 'yoohoo.jpg'
  }
)

whiskers = threatenedcheesesteak.kittens.first

whiskers.image_posts << ImagePost.create(
  image: { io: File.open("#{Rails.root}/app/assets/images/yoohoo.jpg"), filename: 'yoohoo.jpg' },
  owner: threatenedcheesesteak
)

whiskers.image_posts << ImagePost.create(
  image: { io: File.open("#{Rails.root}/app/assets/images/whiskers.jpg"), filename: 'whiskers.jpg' },
  owner: threatenedcheesesteak
)

whiskers.image_posts << ImagePost.create(
  image: { io: File.open("#{Rails.root}/app/assets/images/whiskers2.jpg"), filename: 'whiskers2.jpg' },
  owner: threatenedcheesesteak
)

threatenedcheesesteak.kittens << Kitten.create(
  name: 'Snowball',
  date_of_birth: DateTime.new(2017, 7, 1),
  color: 'White',
  gender: 'Female',
  profile_picture: { 
    io: File.open("#{Rails.root}/app/assets/images/snowball.jpg"),
    filename: 'snowball.jpg'
  }
)

snowball = threatenedcheesesteak.kittens.last

snowball.followers << Follower.create(owner: bubbles)

snowball.image_posts << ImagePost.create(
  image: { io: File.open("#{Rails.root}/app/assets/images/snowball.jpg"), filename: 'snowball.jpg' },
  owner: threatenedcheesesteak
)

snowball.image_posts << ImagePost.create(
  image: { io: File.open("#{Rails.root}/app/assets/images/snowball2.jpg"), filename: 'snowball2.jpg' },
  owner: threatenedcheesesteak
)
