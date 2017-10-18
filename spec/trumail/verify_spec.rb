# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Trumail::Verify do
  subject { Trumail::Verify.new('fake-test@gmail.com') }

  # describe '.initialize' do
  #   it 'returns nil' do
  #     expect(subject.response).to eq(nil)
  #   end
  # end

  describe '.call' do
    it 'returns [ ... ]' do
      subject.verify

      expect(subject.to_h).to eq(nil)
      # expect(Trumail.call(content_source).response).to_not eq(nil)
    end
  end

end
