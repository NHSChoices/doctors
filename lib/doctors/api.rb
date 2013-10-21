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
      'http://3d79c66e59f24dc0b493ac429ce1f575.cloudapp.net/api/organisations'
    end

  end
end
