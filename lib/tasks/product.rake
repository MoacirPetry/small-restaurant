namespace :product do

  desc "Clean all Products"
  task clean: :environment do
  	if Rails.env.development?
      Product.delete_all
      puts "Done - Deleted all products!!"
    else
  		puts "You are not in development mode!"
  	end
  end

  desc "Creating Products"
  task create: :environment do
  	if Rails.env.development?
  		if (ARGV.size == 2) && (ENV['n'] != "")
		  	ENV['n'].to_i.times do |i|
  				name = Faker::Food.dish
  				description = Faker::Food.description
  				category = Category.all.sample
  				product = "Product #{i} = #{name}"
  				puts "Registering... -> #{product}"
  				Product.create(name: name, description: description, category: category)
			  end
  		else
  			puts "You need inform the quantity of products!"
  			puts "e.g. rake product:create n=40"
  		end
  	else
  		puts "You are not in development mode!"
  	end
  end

end
