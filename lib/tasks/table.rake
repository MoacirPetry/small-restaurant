namespace :table do

  desc "Clean all Tables"
  task clean: :environment do
  	if Rails.env.development?
      Table.delete_all
      puts "Done - Deleted all tables!!"
    else
  		puts "You are not in development mode!"
  	end
  end

  desc "Creating Tables"
  task create: :environment do
  	if Rails.env.development?
  		if (ARGV.size == 2) && (ENV['n'] != "")
		  	ENV['n'].to_i.times do |i|
  				status = Faker::Boolean.boolean(0)
  				limit = Faker::Number.within(2..20)
  				table = "Table #{i} = limit #{limit} | status #{status}"
  				puts "Registering... -> #{table}"
  				Table.create(status: status, limit: limit)
			  end
  		else
  			puts "You need inform the quantity of tables!"
  			puts "e.g. rake table:create n=40"
  		end
  	else
  		puts "You are not in development mode!"
  	end
  end

end
