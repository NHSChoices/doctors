module Doctors
  class Search
    class XMLParser

      def initialize(xml)
        @xml = xml
      end

      def parse
        data['feed']['entry'].map do |entry|
          id       = entry['id'].gsub(/^.*\//, '')
          summary  = entry['content']['organisationSummary']
          contact  = summary['contact'] || {}
          phone    = contact['telephone'] || 'Not known'
          Practice.new(summary.merge(id: id, phone: phone))
        end
      end

      private

      def data
        Hash.from_xml(xml)
      end

      attr_reader :xml
    end
  end
end
