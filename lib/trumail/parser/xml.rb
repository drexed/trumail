# frozen_string_literal: true

require 'ox'

module Trumail
  module Parser
    class Xml < Trumail::Parser::Base

      def parse
        @hash = Ox.parse(@data).nodes.each_with_object({}) do |xml, memo|
          value = xml.nodes.first
          memo[xml.value] = eval(value) rescue value
        end
      end

    end
  end
end
