module Doctors
  class Search
    include Id::Model

    field :postcode
    field :page, default: 1

    def results
      Doctors::Search::XMLParser.new(response).parse
    end

    private

    def response
      request.env[:body]
    end

    def request
      Faraday.get(url, params)
    end

    def api_key
      ENV.fetch('API_KEY')
    end

    def params
      { apikey: api_key, range: 50, page: page }
    end

    def url
      "http://#{domain}/#{action}/#{postcode}.xml"
    end

    def domain
      'v1.syndication.nhschoices.nhs.uk'
    end

    def action
      'organisations/gppractices/postcode'
    end

  end
end
