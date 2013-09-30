require 'spec_helper'

module Doctors
  describe Address do

    let (:address) {
      Address.new(
        addressLine1: 'Vantage House',
        addressLine2: '',
        addressLine3: '',
        city: 'Leeds',
        county: 'West Yorkshire',
        postCode: '')
    }

    it 'can return its non-empty lines' do
      expect(address.lines).to eq ['Vantage House', 'Leeds', "West Yorkshire"]
    end

    it 'is enumerable over its non-empty lines' do
      expect(address.map(&:upcase)).to eq ['VANTAGE HOUSE', 'LEEDS', 'WEST YORKSHIRE']
    end

    it 'can format itself with commas' do
      expect(address.formatted).to eq 'Vantage House, Leeds, West Yorkshire'
    end
  end
end
