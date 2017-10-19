# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Trumail::Parser::Base do
  subject { Trumail::Parser::Base.new(json_data) }

  describe '.initialize' do
    it 'returns {}' do
      expect(subject.hash).to eq({})
    end
  end

  describe '.verify' do
    it 'returns :response_hash' do
      expect(Trumail::Parser::Json.parse(json_data)).to eq(response_hash)
    end
  end

end
