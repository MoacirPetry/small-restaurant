namespace :category do

  desc "Clean all Categories"
  task clean: :environment do
  	if Rails.env.development?
      Category.delete_all
      puts "Done - Deleted all categories!!"
    else
  		puts "You are not in development mode!"
  	end
  end

  desc "Creating Categories"
  task create: :environment do
  	if Rails.env.development?
  		if (ARGV.size == 2) && (ENV['n'] != "")
		  	ENV['n'].to_i.times do |i|
  				name = FFaker::Lorem.word
  				description = FFaker::Lorem.phrase
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
