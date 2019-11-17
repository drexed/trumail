# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Trumail::Parser::Base do
  let(:klass) { described_class.new(json_data) }

  describe '.initialize' do
    it 'returns {}' do
      expect(klass.hash).to eq({})
    end
  end

  describe '.parse' do
    it 'returns :response_hash' do
      expect(Trumail::Parser::Json.parse(json_data)).to eq(response_hash)
    end
  end

end
