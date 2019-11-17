# frozen_string_literal: true

require 'bundler/setup'
require 'trumail'

spec_path = Pathname.new(File.expand_path('../spec', File.dirname(__FILE__)))

%w[config helpers].each do |dir|
  Dir.each_child(spec_path.join("support/#{dir}")) do |f|
    load(spec_path.join("support/#{dir}/#{f}"))
  end
end

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.include DataHelper
end
