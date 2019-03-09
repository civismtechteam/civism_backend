# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

def random_comment
  [ Faker::GreekPhilosophers.quote, Faker::Hipster.sentence, Faker::Hacker.say_something_smart ].sample
end

Scoop.create!([
  {
    name: "Amazon's HQ2 in Long Island City",
    image_path: "./"
  }, {
    name: "The Green New Deal",
    image_path: "./"
  }
])

scoops = Scoop.all

100.times do
  User.create!({
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    image_path: Faker::Avatar.image
  })
end

users = User.all

20.times do
  Fact.create!({
    body: Faker::ChuckNorris.fact,
    scoop: scoops.sample,
    source_link: Faker::Internet.url('example.com'),
    user: users.sample
  })
end

facts = Fact.all

20.times do
  Perspective.create!({
    body: random_comment,
    scoop: scoops.sample,
    user: users.sample
  })
end

perspectives = Perspective.all

100.times do
  Comment.create!({
    body: random_comment,
    commentable: [ *facts, *perspectives, *Comment.order("RANDOM()").first(25) ].sample
  })
end

voteables = [ *facts, *perspectives, *Comment.all ]

1000.times do
  begin
    Vote.create({
      user: users.sample,
      direction: rand(2),
      voteable: voteables.sample
    })
  rescue
  end
end
