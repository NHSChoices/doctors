module Doctors
  class Practice
    include Id::Model

    field :pims_url,  key: 'id'
    field :id,        key: 'OrganisationId'
    field :name,      key: 'Name'
    field :ods_code,  key: 'OdsCode'
    field :email_f,   key: 'EmailAddress'
    field :latitude,  key: 'Latitude'
    field :longitude, key: 'Longitude'
    field :phone_f,   key: 'Telephone'

    has_one :address, key: 'Address'

    def email
      email_f unless email_f == { "i:nil" => "true" }# ? "Unknown" : email_f
    end

    def phone
      phone_f == { "i:nil" => "true" } ? "Unknown" : phone_f
    end

    def coordinate
      @coordinate ||= Coordinate.new(longitude: longitude, latitude: latitude)
    end

    def self.find(id)
      API.new(id).response
    end

    def overview
      @overview ||= PracticeOverview.find(id)
    end

    def pims_url
      overview.pims_url
    rescue
      "No data available" # Sadness is a line called 'rescue'
    end

    def opening_times
      overview.opening_times
    rescue
      PracticeOverview::OpeningTimes.new
    end

    def self.model_name
      ActiveModel::Name.new(self, nil, "Practice")
    end

    def persisted?
      true
    end

    def to_partial_path
      'practice'
    end
  end
end
