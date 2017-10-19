# frozen_string_literal: true

require 'trumail'

module LetManager
  extend RSpec::SharedContext

  let(:json_data) do
    <<-DATA
      {
        "address":"test@gmail.com",
        "username":"test",
        "domain":"gmail.com",
        "hostExists":true,
        "deliverable":false,
        "fullInbox":false,
        "catchAll":false,
        "disposable":false,
        "gravatar":true
      }
    DATA
  end

  let(:xml_data) do
    <<-DATA
      <lookup>
        <address>test@gmail.com</address>
        <username>test</username>
        <domain>gmail.com</domain>
        <hostExists>true</hostExists>
        <deliverable>false</deliverable>
        <fullInbox>false</fullInbox>
        <catchAll>false</catchAll>
        <disposable>false</disposable>
        <gravatar>true</gravatar>
      </lookup>
    DATA
  end

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

end

RSpec.configure do |config|
  config.include LetManager
end
