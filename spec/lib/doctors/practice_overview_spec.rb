require 'spec_helper'

module Doctors
  describe PracticeOverview do

    before do
      stub_request(:get, "http://v1.syndication.nhschoices.nhs.uk/organisations/gppractices/4234/overview.xml?apikey=XXXX").
        to_return(File.read('spec/support/overview.xml'))
    end

    let (:overview)      { PracticeOverview.find(4234) }
    let (:opening_times) { overview.opening_times      }

    describe '.find' do
      it 'retrieves a practice, from syndication, by its id' do
        expect(opening_times.sessions).to have(3).items
      end
    end

    describe '#pims_url' do
      it 'has a link to the practice page on the main Choices site' do
        expect(overview.pims_url).to eq 'http://www.nhs.uk/Services/GP/Overview/DefaultView.aspx?id=37899'
      end
    end

    describe '#opening_times' do
      it 'has reception times' do
        expect(opening_times.reception.first).to be_an PracticeOverview::OpeningTimes::Session
      end
      it 'has surgery times' do
        expect(opening_times.surgery.first).to be_an PracticeOverview::OpeningTimes::Session
      end
    end

  end
end
