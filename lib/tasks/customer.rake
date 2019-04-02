namespace :customer do

  desc "Clean all Customers"
  task clean: :environment do
    Customer.delete_all
    puts "Done - Deleted all customers!!"
  end

  desc "Creating Customers"
  task create: :environment do
		if (ARGV.size == 2) && (ENV['n'] != "")
	  	ENV['n'].to_i.times do |i|
				name = Faker::Name.name
				email = Faker::Internet.email
				phone_number = Faker::Base.numerify('265082####')
				customer = "Customer #{i} = #{name}"
				puts "Registering... -> #{customer}"
				Customer.create(name: name, email: email, phone_number: phone_number)
		  end
		else
			puts "You need inform the quantity of customers!"
			puts "e.g. rake customer:create n=40"
		end
  end
end
