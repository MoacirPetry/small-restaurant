namespace :table do

  desc "Clean all Tables"
  task clean: :environment do
    Table.delete_all
    puts "Done - Deleted all tables!!"
  end

  desc "Creating Tables"
  task create: :environment do
		if (ARGV.size == 2) && (ENV['n'] != "")
	  	ENV['n'].to_i.times do |i|
				status = false
				limit = rand(2..20)
				table = "Table #{i} = limit #{limit} | status #{status}"
				puts "Registering... -> #{table}"
				Table.create(status: status, limit: limit)
		  end
		else
			puts "You need inform the quantity of tables!"
			puts "e.g. rake table:create n=40"
		end
  end
end
