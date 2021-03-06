# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Trumail::Lookup do
  let(:klass) { described_class.new('test@gmail.com') }

  let(:trumail_json) do
    VCR.use_cassette('json') do
      described_class.verify('test@gmail.com', format: :json)
    end
  end
  let(:trumail_xml) do
    VCR.use_cassette('xml') do
      described_class.verify('test@gmail.com', format: :xml)
    end
  end

  describe '.initialize' do
    it 'returns "test@email.com"' do
      expect(klass.email).to eq('test@gmail.com')
    end

    it 'returns "https://api.trumail.io"' do
      expect(klass.host).to eq('https://api.trumail.io')
    end

    it 'returns :json' do
      expect(klass.format).to eq(:json)
    end

    it 'returns nil' do
      expect(klass.response).to eq(nil)
    end

    it 'returns {}' do
      expect(klass.hash).to eq({})
    end
  end

  describe '.verify' do
    it 'returns :response_hash for json format' do
      expect(trumail_json.hash).to eq(response_hash)
      expect(trumail_json.verify).to eq(response_hash)
    end

    it 'returns :response_hash for xml format' do
      response_hash['suggestion'] = nil

      expect(trumail_xml.hash).to eq(response_hash)
      expect(trumail_xml.verify).to eq(response_hash)
    end
  end

  describe '.url' do
    json_url = 'https://api.trumail.io/v2/lookups/json?email=test@gmail.com'
    xml_url = 'https://api.trumail.io/v2/lookups/xml?email=test@gmail.com'

    it "returns #{json_url}" do
      expect(klass.url).to eq(json_url)
      expect(trumail_json.url).to eq(json_url)
    end

    it "returns #{xml_url}" do
      expect(trumail_xml.url).to eq(xml_url)
    end
  end

  describe '.success?' do
    it 'returns true' do
      expect(trumail_json.success?).to eq(true)
      expect(trumail_xml.success?).to eq(true)
    end
  end

  describe '.error?' do
    it 'returns true' do
      expect(trumail_json.error?).to eq(false)
      expect(trumail_xml.error?).to eq(false)
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

  describe '.free?' do
    value = true

    it "returns #{value.inspect}" do
      expect(trumail_json.free?).to eq(value)
      expect(trumail_xml.free?).to eq(value)
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
    value = false

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

  describe '.md5_hash' do
    value = nil

    it 'returns not nil' do
      expect(trumail_json.md5_hash).not_to eq(value)
      expect(trumail_xml.md5_hash).not_to eq(value)
    end
  end

  describe '.role?' do
    value = false

    it "returns #{value.inspect}" do
      expect(trumail_json.role?).to eq(value)
      expect(trumail_xml.role?).to eq(value)
    end
  end

  describe '.suggestion' do
    it 'returns "" for json format' do
      expect(trumail_json.suggestion).to eq('')
    end

    it 'returns nil for xml format' do
      expect(trumail_xml.suggestion).to eq(nil)
    end
  end

  describe '.username' do
    value = 'test'

    it "returns #{value.inspect}" do
      expect(trumail_json.username).to eq(value)
      expect(trumail_xml.username).to eq(value)
    end
  end

  describe '.valid_format?' do
    value = true

    it "returns #{value.inspect}" do
      expect(trumail_json.valid_format?).to eq(value)
      expect(trumail_xml.valid_format?).to eq(value)
    end
  end

end
