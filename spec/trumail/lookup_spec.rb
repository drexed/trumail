# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Trumail::Lookup do
  subject { Trumail::Lookup.new('test@gmail.com') }
  let(:trumail_json) { Trumail::Lookup.verify('test@gmail.com', format: :json) }
  let(:trumail_xml) { Trumail::Lookup.verify('test@gmail.com', format: :xml) }

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
      expect(trumail_json.hash).to eq(response_hash)
      expect(trumail_xml.hash).to eq(response_hash)
    end

    it 'returns :response_hash' do
      expect(trumail_json.verify).to eq(response_hash)
      expect(trumail_xml.verify).to eq(response_hash)
    end
  end

  describe '.url' do
    json_url = 'https://trumail.io/json/test@gmail.com'
    xml_url = 'https://trumail.io/xml/test@gmail.com'

    it "returns #{json_url}" do
      expect(subject.url).to eq(json_url)
      expect(trumail_json.url).to eq(json_url)
    end

    it "returns #{xml_url}" do
      expect(trumail_xml.url).to eq(xml_url)
    end
  end

  describe '.address' do
    value = 'test@gmail.com'

    it "returns #{value.inspect}" do
      expect(trumail_json.address).to eq(value)
      expect(trumail_xml.address).to eq(value)
    end
  end

  describe '.catch_all?' do
    value = false

    it "returns #{value.inspect}" do
      expect(trumail_json.catch_all?).to eq(value)
      expect(trumail_xml.catch_all?).to eq(value)
    end
  end

  describe '.deliverable?' do
    value = false

    it "returns #{value.inspect}" do
      expect(trumail_json.deliverable?).to eq(value)
      expect(trumail_xml.deliverable?).to eq(value)
    end
  end

  describe '.disposable?' do
    value = false

    it "returns #{value.inspect}" do
      expect(trumail_json.disposable?).to eq(value)
      expect(trumail_xml.disposable?).to eq(value)
    end
  end

  describe '.domain' do
    value = 'gmail.com'

    it "returns #{value.inspect}" do
      expect(trumail_json.domain).to eq(value)
      expect(trumail_xml.domain).to eq(value)
    end
  end

  describe '.full_inbox?' do
    value = false

    it "returns #{value.inspect}" do
      expect(trumail_json.full_inbox?).to eq(value)
      expect(trumail_xml.full_inbox?).to eq(value)
    end
  end

  describe '.gravatar?' do
    value = true

    it "returns #{value.inspect}" do
      expect(trumail_json.gravatar?).to eq(value)
      expect(trumail_xml.gravatar?).to eq(value)
    end
  end

  describe '.host_exists?' do
    value = true

    it "returns #{value.inspect}" do
      expect(trumail_json.host_exists?).to eq(value)
      expect(trumail_xml.host_exists?).to eq(value)
    end
  end

  describe '.username' do
    value = 'test'

    it "returns #{value.inspect}" do
      expect(trumail_json.username).to eq(value)
      expect(trumail_xml.username).to eq(value)
    end
  end

end
