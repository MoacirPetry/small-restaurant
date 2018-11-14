namespace :user do

  desc "Clean all Users"
  task clean: :environment do
    User.delete_all
    puts "Done - Deleted all users!!"
  end

  desc "Creating Users"
  task create: :environment do
    User.create(email: "admin@small-restaurant.herokuapp.com", password: 123456)
		if (ARGV.size == 2) && (ENV['n'] != "")
	  	ENV['n'].to_i.times do |i|
				email = Faker::Internet.email
				password = 123456
				user = "User #{i} = email #{email}"
				puts "Registering... -> #{user}"
				User.create(email: email, password: password)
		  end
		else
			puts "You need inform the quantity of users!"
			puts "e.g. rake user:create n=40"
		end
  end
end
