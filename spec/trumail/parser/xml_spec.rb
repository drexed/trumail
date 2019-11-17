# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Trumail::Parser::Xml do
  let(:klass) { described_class.new(xml_data) }

  describe '.parse' do
    it 'returns :response_hash' do
      klass.parse

      response_hash['suggestion'] = nil

      expect(klass.hash).to eq(response_hash)
    end
  end

end
