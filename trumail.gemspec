# frozen_string_literal: true

# coding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'trumail/version'

Gem::Specification.new do |spec|
  spec.name = 'trumail'
  spec.version = Trumail::VERSION
  spec.authors = ['Juan Gomez']
  spec.email = ['j.gomez@drexed.com']

  spec.summary = 'Trumail Ruby SDK.'
  spec.description = 'Trumail Ruby SDK for interacting with the Trumail API.'
  spec.homepage = 'http://drexed.github.io/trumail'
  spec.license = 'MIT'

  spec.files = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = %w[lib support]

  spec.add_runtime_dependency 'ox'
  spec.add_runtime_dependency 'typhoeus'
  spec.add_runtime_dependency 'user_agent_db'

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'fasterer'
  spec.add_development_dependency 'reek'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'vcr'
  spec.add_development_dependency 'webmock'
end
