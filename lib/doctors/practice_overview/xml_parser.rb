module Doctors
  class PracticeOverview
    class XMLParser
      def initialize(xml)
        @xml = xml
      end

      def parse
        PracticeOverview.new(overview)
      end

      private

      def overview
        data['feed']['entry']['content']['overview']
      end

      def data
        @data ||= Hash.from_xml(xml)
      end

      attr_reader :xml
    end
  end
end
