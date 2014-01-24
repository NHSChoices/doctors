require 'spec_helper'

module Doctors
  describe Practice do

    before do
      stub_request(:get, "http://v1.syndication.nhschoices.nhs.uk/organisations/gppractices/4234.xml?apikey=XXXX").
        to_return(File.read('spec/support/practice.xml'))
    end

    describe '.find' do
      it 'retrieves a practice, from syndication, by its id' do
        practice = Practice.find(4234)
        expect(practice).to be_a Practice
        expect(practice.name).to eq 'City View Medical Practice'
        expect(practice.ods_code).to eq 'B86002'
        expect(practice.email).to eq 'victoria.keys@nhs.net'
        expect(practice.coordinate).to eq Coordinate.new(longitude: "-1.5568481683731079", latitude: "53.778114318847656")
        expect(practice.phone).to eq '0113 2760717'
        expect(practice.address).to be_a Practice::Address
      end
    end
  end
end
