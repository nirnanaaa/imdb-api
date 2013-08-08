require 'imdb-api'

Dir[File.join(File.dirname(__FILE__),"support", "**", "*.rb")].each {|f| require f}

RSpec.configure do |config|

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = "random"

  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.filter_run focus: true
  config.run_all_when_everything_filtered = true
  
  config.filter_run_excluding :slow unless ENV["SLOW_SPECS"]

  config.before(:all) { DeferredGarbageCollection.start }
  config.after(:all) { DeferredGarbageCollection.reconsider }
end