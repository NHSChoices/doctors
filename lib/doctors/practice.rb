module Doctors
  class Practice
    include Id::Model

    field :id
    field :name
    field :phone
    field :ods_code, key: 'odsCode'

    has_one :address
    has_one :coordinate, key: 'geographicCoordinates'

    def self.find
    end
  end
end
