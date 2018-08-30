# frozen_string_literal: true

require 'typhoeus'
require 'user_agent_db'

module Trumail
  class Lookup

    DEFAULT_HOST ||= 'https://api.trumail.io'
    DEFAULT_FORMAT ||= :json

    attr_reader :email, :hash, :host, :format, :response

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

      Typhoeus::Config.user_agent = UserAgentDB.random
      @response = Typhoeus.get(url, accept_encoding: 'gzip,deflate').response_body

      parse_by_format
    end

    def url
      "#{@host}/v2/lookups/#{@format}?email=#{@email}"
    end

    def error?
      !success?
    end

    def success?
      @hash.key?('address')
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

    def free?
      @hash['free']
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

    def md5_hash
      @hash['md5Hash']
    end

    def role?
      @hash['role']
    end

    def suggestion
      @hash['suggestion']
    end

    def username
      @hash['username']
    end

    def valid_format?
      @hash['validFormat']
    end

    private

    def parse_by_format
      return @hash if @response.nil?

      @hash = case @format
              when :json then Trumail::Parser::Json.parse(@response)
              when :xml then Trumail::Parser::Xml.parse(@response)
              end
    end

  end
end
