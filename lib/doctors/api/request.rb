module Doctors
  module API
    class Request

      def initialize(url, params = {})
        @url = url
        @params = params
      end

      def response
        status == 200 ? body : error
      end

      private

      def status
        request.env[:status]
      end

      def error
        raise Error.new(status, message)
      end

      def message
        body.fetch('message')
      end

      def body
        @body ||= Yajl::Parser.parse(request.env[:body])
      end

      def request
        @request ||= Faraday.get(url, params)
      end

      attr_reader :url, :params
    end
  end
end
