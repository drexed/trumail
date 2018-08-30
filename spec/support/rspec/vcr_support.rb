# frozen_string_literal: true

require 'vcr'

VCR.configure do |config|
  config.allow_http_connections_when_no_cassette = true
  config.cassette_library_dir = 'spec/cassettes'
  config.hook_into :webmock
  config.default_cassette_options = { re_record_interval: 604_800 } # 7 days
  config.configure_rspec_metadata!
end
