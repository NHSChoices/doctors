require 'spec_helper'

module Doctors
  describe Search do

    before do
      stub_request(:get, "http://v1.syndication.nhschoices.nhs.uk/organisations/gppractices/postcode/LS1.xml?apikey=XXXX&page=1&range=50").
        to_return(File.read('spec/support/search.xml'))
    end

    let (:search) { Search.new(postcode: 'LS1') }

    it 'retrieves a set of 10 results' do
      expect(search.results).to have(10).items
    end

    it 'parses the returned xml into Practice objects' do
      result = search.results.first
      expect(result).to be_a Practice
      expect(result.id).to eq '44531'
      expect(result.name).to eq 'One Medicare @ The Light'
      expect(result.ods_code).to eq 'Y02002'
      expect(result.address).to be_an Address
      expect(result.phone).to eq '0113 242 7425'
      expect(result.coordinate).to be_a Coordinate
    end

  end
end
