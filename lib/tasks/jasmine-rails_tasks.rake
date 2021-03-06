namespace :spec do

  desc "run test with phantomjs"
  task :javascript => [:environment] do
    if Rails.env.test?
      require 'jasmine_rails/runner'
      spec_filter = ENV['SPEC']
      reporters = ENV.fetch('REPORTERS', 'console')
      JasmineRails::Runner.run spec_filter, reporters
    else
      system("RAILS_ENV=test bundle exec rake #{ARGV.join(' ')}")
    end
  end

  # alias
  task :javascripts => :javascript
end
