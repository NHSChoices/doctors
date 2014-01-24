module Doctors
  class Practice
    class Address
      include Id::Model
      include Enumerable

      field :line_1, key: 'Line1', optional: true
      field :line_2, key: 'Line2', optional: true
      field :line_3, key: 'Line3', optional: true
      field :line_4, key: 'Line4', optional: true
      field :line_5, key: 'Line5', optional: true

      field :postcode, key: 'Postcode'

      def lines
        [line_1, line_2, line_3, line_4, line_5].flatten.reject(&:blank?)
      end

      def formatted
        lines.join(', ')
      end

      def each(&block)
        lines.each(&block)
      end
    end
  end
end
