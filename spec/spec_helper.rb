# frozen_string_literal: true

%w[trumail pathname].each do |file_name|
  require file_name
end

spec_support_path = Pathname.new(File.expand_path('../spec/support', File.dirname(__FILE__)))

Dir.glob(spec_support_path.join('**/*.rb'))
   .each { |f| load(f) }

RSpec.configure do |config|
  config.include LetSupport
end
