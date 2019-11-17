# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Trumail::Parser::Xml do
  subject { described_class.new(xml_data) }

  describe '.parse' do
    it 'returns :response_hash' do
      subject.parse

      response_hash['suggestion'] = nil

      expect(subject.hash).to eq(response_hash)
    end
  end

end
