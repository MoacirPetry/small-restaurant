namespace :setup do
  desc "Deleting all values"
  task clean: :environment do
    Rake::Task["category:clean"].execute
  end

  desc "Creating all values"
  task create: :environment do
    Rake::Task["category:create"].execute
  end

end
