module Doctors
  class Practice
    include Id::Model

    field :id,        key: 'OrganisationId'
    field :name,      key: 'Name'
    field :ods_code,  key: 'OdsCode'
    field :email,     key: 'EmailAddress'
    field :latitude,  key: 'Latitude'
    field :longitude, key: 'Longitude'
    field :phone, key: 'Telephone'

    has_one :address, key: 'Address'

    def coordinate
      @coordinate ||= Coordinate.new(longitude: longitude, latitude: latitude)
    end

    def self.find(id)
      API.new(id).response
    end

    def opening_times
      PracticeOverview.find(id).opening_times
    rescue
      "No data available" # This makes me :-( but given syndication...
    end

  end
end
