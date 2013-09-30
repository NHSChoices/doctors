module Doctors
  module API
    extend self

    def search(criteria)
      Request.new(url, criteria).response
    end

    def find(id)
      Request.new("#{url}/#{id}").response
    end

    private

    def url
      'http://nhs-api.cloudapp.net/api/Organisations'
    end

  end
end
