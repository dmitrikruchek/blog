begin
  require 'database_cleaner'
  require 'database_cleaner/cucumber'
  DatabaseCleaner[:active_record,{:connection => :development}].strategy = :deletion
rescue NameError
  raise "You need to add database_cleaner to your Gemfile (in the :test group) if you wish to use it."
end

Before do
  DatabaseCleaner.clean
end

After do
  DatabaseCleaner.clean
end


