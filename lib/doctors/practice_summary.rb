module Doctors
  class PracticeSummary
    include Id::Model

    field :id
    field :name
    field :phone
    field :distance, key: 'Distance'
    field :ods_code, key: 'odsCode'

    has_one :address
    has_one :coordinate, key: 'geographicCoordinates'

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
