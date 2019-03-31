namespace :manage do
  desc "Get role admin and activation by first user"
  task :add_cats  => :environment do

    Category.create(name: "Игры", color: "yellow")
    Category.create(name: "Хочу кушать", color: "red")
    Category.create(name: "Развлечения", color: "purple")
    puts " was added"
  end
end