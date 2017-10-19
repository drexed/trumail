# frozen_string_literal: true

%w[base json xml].each do |file_name|
  require "trumail/parser/#{file_name}"
end

%w[version lookup].each do |file_name|
  require "trumail/#{file_name}"
end
