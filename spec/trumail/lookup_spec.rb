# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Trumail::Lookup do
  subject { Trumail::Lookup.new('test@gmail.com') }
  let(:trumail) { Trumail::Lookup.verify('test@gmail.com') }

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

  describe '.verify' do
    it 'returns :response_hash' do
      subject.verify

      expect(subject.to_h).to eq(response_hash)
      expect(trumail.to_h).to eq(response_hash)
    end

    it 'returns :response_hash' do
      expect(trumail.verify).to eq(response_hash)
    end
  end

  describe '.url' do
    url = 'https://trumail.io/json/test@gmail.com'

    it "returns #{url}" do
      expect(subject.url).to eq(url)
      expect(trumail.url).to eq(url)
    end
  end

  describe '.to_h' do
    it 'returns {}' do
      expect(subject.to_h).to eq({})
    end

    it 'returns :response_hash' do
      expect(trumail.to_h).to eq(response_hash)
    end
  end

  describe '.address' do
    value = 'test@gmail.com'

    it "returns #{value.inspect}" do
      expect(trumail.address).to eq(value)
    end
  end

  describe '.catch_all?' do
    value = false

    it "returns #{value.inspect}" do
      expect(trumail.catch_all?).to eq(value)
    end
  end

  describe '.deliverable?' do
    value = false

    it "returns #{value.inspect}" do
      expect(trumail.deliverable?).to eq(value)
    end
  end

  describe '.disposable?' do
    value = false

    it "returns #{value.inspect}" do
      expect(trumail.disposable?).to eq(value)
    end
  end

  describe '.domain' do
    value = 'gmail.com'

    it "returns #{value.inspect}" do
      expect(trumail.domain).to eq(value)
    end
  end

  describe '.full_inbox?' do
    value = false

    it "returns #{value.inspect}" do
      expect(trumail.full_inbox?).to eq(value)
    end
  end

  describe '.gravatar?' do
    value = true

    it "returns #{value.inspect}" do
      expect(trumail.gravatar?).to eq(value)
    end
  end

  describe '.host_exists?' do
    value = true

    it "returns #{value.inspect}" do
      expect(trumail.host_exists?).to eq(value)
    end
  end

  describe '.username' do
    value = 'test'

    it "returns #{value.inspect}" do
      expect(trumail.username).to eq(value)
    end
  end

end
