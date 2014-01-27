module Doctors
  class PracticeOverview
    include Id::Model

    field :pims_url
    has_one :opening_times, type: OpeningTimes, key: 'openingTimes'

    def self.find(id)
      API.new(id).response
    end

  end
end
