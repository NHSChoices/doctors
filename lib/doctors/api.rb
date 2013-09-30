module Doctors
  module API
    extend self

    def search(criteria)
      Request.new(url, criteria).response.fetch('data')
    end

    def find(id)
      Request.new("#{url}/#{id}").response.fetch('data')
    end

    private

    def url
      'http://nhs-api.cloudapp.net/api/Organisations'
    end

  end
end
