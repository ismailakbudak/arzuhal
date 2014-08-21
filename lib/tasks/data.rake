 # Taskı çalıştırmak için
# rake db:reset
# rake db:populate

namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_users
    make_tweets 
  end
end

def make_users 

  99.times do |n|
    name  = Faker::Name.name
    surname  = Faker::Name.name
    email = "example-#{n+1}@railstutorial.org"
    bio  = Faker::Lorem.sentence(7)
 
    User.create!(name:     name,
                 surname:  surname, 
                 email:    email,
                 bio:  bio)
  end
end

def make_tweets
  users = User.all().limit(3)
  50.times do
    tweet = Faker::Lorem.sentence(5) + Faker::Lorem.sentence(5)
    users.each { |user| user.tweets.create!(tweet: tweet) }
  end
end
 