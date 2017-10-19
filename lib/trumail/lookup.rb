# frozen_string_literal: true

require 'typhoeus'

module Trumail
  class Lookup

    DEFAULT_HOST ||= 'https://trumail.io'
    DEFAULT_FORMAT ||= :json

    attr_reader :email, :host, :format, :response, :hash

    def initialize(email, host: DEFAULT_HOST, format: DEFAULT_FORMAT)
      @email = email
      @host = host
      @format = format.to_sym
      @response = nil
      @hash = {}
    end

    def self.verify(email, host: DEFAULT_HOST, format: DEFAULT_FORMAT)
      klass = new(email, host: host, format: format)
      klass.verify
      klass
    end

    def verify
      return @hash unless @response.nil?
      @response = Typhoeus.get(url).response_body
      @hash = parse_by_format
    end

    def url
      "#{@host}/#{@format}/#{@email}"
    end

    def to_h
      @hash
    end

    def address
      @hash['address']
    end

    def catch_all?
      @hash['catchAll']
    end

    def deliverable?
      @hash['deliverable']
    end

    def disposable?
      @hash['disposable']
    end

    def domain
      @hash['domain']
    end

    def full_inbox?
      @hash['fullInbox']
    end

    def gravatar?
      @hash['gravatar']
    end

    def host_exists?
      @hash['hostExists']
    end

    def username
      @hash['username']
    end

    private

    def parse_by_format
      return @hash if @response.nil?

      case @format
      when :json then Trumail::Parser::Json.parse(@response)
      when :xml then Trumail::Parser::Xml.parse(@response)
      end
    end

  end
end