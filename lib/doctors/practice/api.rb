module Doctors
  class Practice
    class API

      def initialize(id)
        @id = id
      end

      def response
        XMLParser.new(request.env[:body]).parse
      end

      private

      attr_reader :id

      def request
        Faraday.get(url, apikey: api_key)
      end

      def url
        "http://#{domain}/#{action}/#{id}.xml"
      end

      def domain
        'v1.syndication.nhschoices.nhs.uk'
      end

      def action
        'organisations/gppractices'
      end

      def api_key
        ENV['SYNDICATION_API_KEY']
      end

    end
  end
end
