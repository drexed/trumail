# frozen_string_literal: true

%w[trumail pathname].each do |file_name|
  require file_name
end

spec_support_path = Pathname.new(File.expand_path('../spec/support', File.dirname(__FILE__)))
load(spec_support_path.join('rspec/let_manager.rb'))

RSpec.configure do |config|
  config.include LetManager
end
