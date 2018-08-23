# frozen_string_literal: true

RSpec.configure do |config|
  config.use_transactional_fixtures = false
  Capybara.javascript_driver = :webkit

  config.include AccepranceHelper, type: :feature
  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end
  config.before do
    DatabaseCleaner.strategy = :transaction
  end
  config.before do
    DatabaseCleaner.strategy = :truncation
  end
  config.before do
    DatabaseCleaner.start
  end
  config.before do
    DatabaseCleaner.clean
  end
end
