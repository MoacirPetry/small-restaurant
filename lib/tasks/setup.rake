namespace :setup do
  desc "Deleting all values"
  task clean: :environment do
    Rake::Task["order:clean"].execute
    Rake::Task["product:clean"].execute
    Rake::Task["category:clean"].execute
    Rake::Task["customer:clean"].execute
    Rake::Task["table:clean"].execute
  end

  desc "Creating all values"
  task create: :environment do
    Rake::Task["category:create"].execute
    Rake::Task["customer:create"].execute
    Rake::Task["table:create"].execute
    Rake::Task["product:create"].execute
    Rake::Task["order:create"].execute
  end

end
