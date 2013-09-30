module Doctors
  module API
    class Error < StandardError

      def initialize(status)
        @status = status
        @message = message
        super "API Error: #{status} - #{message}"
      end

      attr_reader :status, :message
    end
  end
end
