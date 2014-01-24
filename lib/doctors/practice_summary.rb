module Doctors
  class PracticeSummary
    include Id::Model

    field :id
    field :name
    field :phone
    field :ods_code, key: 'odsCode'

    has_one :address
    has_one :coordinate, key: 'geographicCoordinates'

  end
end
