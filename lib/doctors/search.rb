module Doctors
  class Search
    include Id::Model
    include Id::Form

    field :location
    field :offset,  default: 0
    field :limit,   default: 10

    validates_presence_of :location

    def results
      @results ||= API.search(location, criteria).map(&Practice)
    end

    def criteria
      { organisationtype: 'GPB', offset: offset, limit: limit }
    end

    def to_param
      location
    end

    def self.model_name
      ActiveModel::Name.new(self, nil, "Search")
    end

    def to_partial_path
      'search'
    end
  end
end
