module Doctors
  class Coordinate
    include Id::Model

    field :longitude
    field :latitude
  end
end
