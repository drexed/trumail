# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Trumail::Verify do
  subject { Trumail::Verify.new('test@gmail.com') }
  let(:trumail) { Trumail::Verify.verify('test@gmail.com') }

  let(:response_hash) do
    {
      'address' => 'test@gmail.com',
      'username' => 'test',
      'domain' => 'gmail.com',
      'hostExists' => true,
      'deliverable' => false,
      'fullInbox' => false,
      'catchAll' => false,
      'disposable' => false,
      'gravatar' => true
    }
  end

  describe '.initialize' do
    it 'returns "test@email.com"' do
      expect(subject.email).to eq('test@gmail.com')
    end

    it 'returns "https://trumail.io"' do
      expect(subject.host).to eq('https://trumail.io')
    end

    it 'returns :json' do
      expect(subject.format).to eq(:json)
    end

    it 'returns nil' do
      expect(subject.response).to eq(nil)
    end

    it 'returns {}' do
      expect(subject.hash).to eq({})
    end
  end

  describe '.call' do
    it 'returns [ ... ]' do
      subject.verify

      expect(subject.to_h).to eq(response_hash)
      expect(trumail.to_h).to eq(response_hash)
    end
  end

  describe '.url' do
    it 'returns "https://trumail.io/json/test@gmail.com"' do
      expect(subject.url).to eq('https://trumail.io/json/test@gmail.com')
    end
  end

  describe '.to_h' do
    it 'returns {}' do
      expect(subject.to_h).to eq({})
    end
  end

end
