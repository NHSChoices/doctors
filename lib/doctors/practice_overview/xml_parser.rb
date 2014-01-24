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
        data['feed']['entry']['content']['overview'].merge(pims_url: pims_url)
      end

      def pims_url
        Nokogiri::XML(xml).xpath('//link[@rel="alternative"]/@href').first
      end

      def data
        @data ||= Hash.from_xml(xml)
      end

      attr_reader :xml
    end
  end
end
