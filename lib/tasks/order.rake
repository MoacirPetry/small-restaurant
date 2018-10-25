namespace :order do

  desc "Clean all Orders"
  task clean: :environment do
  	if Rails.env.development?
      Order.delete_all
      puts "Done - Deleted all orders!!"
    else
  		puts "You are not in development mode!"
  	end
  end

  desc "Creating Orders"
  task create: :environment do
    if Rails.env.development?
  		if (ARGV.size == 2) && (ENV['n'] != "")
		  	ENV['n'].to_i.times do |i|
  				status = false
  				total = Faker::Number.within(0..0)
          user = User.all.sample
          customer = Customer.all.sample
          table = Table.all.sample
  				puts "Registering order... -> #{i}"
  				Order.create(status: status, total: total, user: user, customer: customer, table: table)
			  end
  		else
  			puts "You need inform the quantity of orders!"
  			puts "e.g. rake order:create n=40"
  		end
  	else
  		puts "You are not in development mode!"
  	end
  end

end
