require 'spec_helper'

module Doctors
  describe Search do

    let (:search) { Search.new(location: 'NR1') }

    it 'performs a practice search' do
      stub_request(:get, "http://nhs-api.cloudapp.net/api/Organisations/NR1?limit=10&offset=0&organisationtype=GPB").to_return(Fixtures.practices)
      expect(search.results).to have_at_least(1).item
      search.results.each { |result| expect(result).to be_a Practice }
    end

    it 'raises an API::Error on a non-200 response' do
      stub_request(:get, "http://nhs-api.cloudapp.net/api/Organisations/NR1?limit=10&offset=0&organisationtype=GPB").to_return(Fixtures.not_found)
      expect { search.results }.to raise_error API::Error
    end

  end
end
