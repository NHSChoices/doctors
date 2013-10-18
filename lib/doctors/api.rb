module Doctors
  module API
    extend self

    def search(location, criteria)
      Request.new("#{url}/#{location}", criteria).response.fetch('data')
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
