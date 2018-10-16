namespace :setup do
  desc "Deleting all values"
  task clean: :environment do
    Rake::Task["category:clean"].execute
    Rake::Task["customer:clean"].execute
  end

  desc "Creating all values"
  task create: :environment do
    Rake::Task["category:create"].execute
    Rake::Task["customer:create"].execute
  end

end
