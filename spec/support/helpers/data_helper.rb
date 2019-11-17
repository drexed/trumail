# frozen_string_literal: true

module DataHelper

  extend RSpec::SharedContext

  let(:json_data) do
    <<-DATA
      {
        "address":"test@gmail.com",
        "username":"test",
        "domain":"gmail.com",
        "md5Hash":"1aedb8d9dc4751e229a335e371db8058",
        "suggestion":"",
        "free":true,
        "hostExists":true,
        "deliverable":false,
        "fullInbox":false,
        "catchAll":false,
        "disposable":false,
        "gravatar":false,
        "role":false,
        "validFormat":true
      }
    DATA
  end

  let(:xml_data) do
    <<-DATA
      <lookup>
        <address>test@gmail.com</address>
        <username>test</username>
        <domain>gmail.com</domain>
        <md5Hash>1aedb8d9dc4751e229a335e371db8058</md5Hash>
        <suggestion/>
        <validFormat>true</validFormat>
        <deliverable>false</deliverable>
        <fullInbox>false</fullInbox>
        <hostExists>true</hostExists>
        <catchAll>false</catchAll>
        <gravatar>false</gravatar>
        <role>false</role>
        <disposable>false</disposable>
        <free>true</free>
      </lookup>
    DATA
  end

  let(:response_hash) do
    {
      'address' => 'test@gmail.com',
      'username' => 'test',
      'domain' => 'gmail.com',
      'md5Hash' => '1aedb8d9dc4751e229a335e371db8058',
      'suggestion' => '',
      'free' => true,
      'hostExists' => true,
      'deliverable' => false,
      'fullInbox' => false,
      'catchAll' => false,
      'disposable' => false,
      'gravatar' => false,
      'role' => false,
      'validFormat' => true
    }
  end

end
