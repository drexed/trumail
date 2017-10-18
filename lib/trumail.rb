# frozen_string_literal: true

%w[version verify].each do |file_name|
  require "trumail/#{file_name}"
end
