require 'faker'
namespace :category do

  desc "Clean all Categories"
  task clean: :environment do
  	# if Rails.env.development?
  	if Rails.env.production?
      Category.delete_all
      puts "Done - Deleted all categories!!"
    else
  		puts "You are not in development mode!"
  	end
  end

  desc "Creating Categories"
  task create: :environment do
  	# if Rails.env.development?
  	if Rails.env.production? # just for heroku
  		if (ARGV.size == 2) && (ENV['n'] != "")
		  	ENV['n'].to_i.times do |i|
  				name = Faker::Commerce.department
  				description = Faker::Commerce.department(5)
  				category = "Category #{i} = #{name}"
  				puts "Registering... -> #{category}"
  				Category.create(name: name, description: description)
			  end
  		else
  			puts "You need inform the quantity of categories!"
  			puts "e.g. rake category:create n=40"
  		end
  	else
  		puts "You are not in development mode!"
  	end
  end

end
