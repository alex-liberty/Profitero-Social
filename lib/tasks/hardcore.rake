namespace :manage do
  desc "Get role admin and activation by first user"
  task :add_cats  => :environment do

    Category.create(name: "Games")
    Category.create(name: "Food")
    Category.create(name: "Outdoor")
    puts " was added"
  end
end