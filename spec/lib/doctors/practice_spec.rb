require 'spec_helper'

module Doctors
  describe Practice do

    it "can convert itself to a param (for Rails)" do
      expect(Practice.new(id: 123).to_param).to eq 123
    end

    it "knows if it has female GPs" do
      expect(Practice.new(gender:['female'])).to have_female_gps
    end

    it "knows if it doesn't have female GPs" do
      expect(Practice.new(gender:[])).not_to have_female_gps
    end

    it "knows if it has male GPs" do
      expect(Practice.new(gender:['male'])).to have_male_gps
    end

    it "knows if it doesn't have male GPs" do
      expect(Practice.new(gender:[])).not_to have_male_gps
    end

    describe ".find" do
      it 'retrieves a specific practice by id' do
        stub_request(:get, "http://3d79c66e59f24dc0b493ac429ce1f575.cloudapp.net/api/organisations/415").to_return(Fixtures.practice)
        expect(Practice.find(415)).to be_a Practice
      end
    end
  end
end
