# frozen_string_literal: true

require 'json'
require 'typhoeus'

module Trumail
  class Verify

    DEFAULT_HOST ||= 'https://trumail.io'
    DEFAULT_FORMAT ||= :json

    attr_reader :email, :host, :format, :response

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
      @response = Typhoeus.get(url).response_body
      @hash = parse_by_format
    end

    def url
      "#{@host}/#{@format}/#{@email}"
    end

    def to_h
      @hash
    end

    private

    def parse_by_format
      return @hash if @format == :xml
      JSON.parse(@response)
    end

  end
end
