# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Trumail::Parser::Json do
  let(:klass) { described_class.new(json_data) }

  describe '.parse' do
    it 'returns :response_hash' do
      klass.parse

      expect(klass.hash).to eq(response_hash)
    end
  end

end
