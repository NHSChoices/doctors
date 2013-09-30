module Doctors
  class Search
    include Id::Model
    include Id::Form
    include Doctors::Validations

    field :location
    field :offset,  default: 0
    field :limit,   default: 10

    validates_presence_of :location

    def results
      @results ||= API.search(criteria).map(&Practice)
    end

    def criteria
      { organisationtype: 'GPB', offset: offset, limit: limit }
    end

  end
end
