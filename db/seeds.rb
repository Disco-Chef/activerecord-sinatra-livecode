require 'faker'

20.times do
  Restaurant.create(
    name: Faker::Creature::Horse.name,
    city: Faker::TvShows::RickAndMorty.location
  )
end
