module Doctors
  class Practice
    class XMLParser
      def initialize(xml)
        @xml = xml
      end

      def parse
        Practice.new(organisation)
      end

      private

      def organisation
        data['Organisation']
      end

      def data
        @data ||= Hash.from_xml(xml)
      end

      attr_reader :xml
    end
  end
end
