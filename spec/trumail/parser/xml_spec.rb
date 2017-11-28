# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Trumail::Parser::Xml do
  subject { Trumail::Parser::Xml.new(xml_data) }

  describe '.parse' do
    it 'returns :response_hash' do
      subject.parse

      expect(subject.hash).to eq(response_hash)
    end
  end

end
