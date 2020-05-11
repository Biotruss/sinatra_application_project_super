5.times do
  User.create(name: Faker::Name.name, email: Faker::Internet.email)
  Post.create(title: Faker::Game.title, body: Faker::Games::Fallout.quote, user_id:1)
  Post.create(title: Faker::Game.title, body: Faker::Games::Dota.quote, user_id:2)
  Post.create(title: Faker::Game.title, body: Faker::Games::HeroesOfTheStorm.quote, user_id:3)
  Post.create(title: Faker::Game.title, body: Faker::Games::Witcher.quote, user_id:4)
  Post.create(title: Faker::Game.title, body: Faker::Games::WorldOfWarcraft.quote, user_id:5)
end
