module Doctors
  class PracticeSummary
    class Address
      include Id::Model

      field :lines, key: 'addressLine'
      field :postcode

      def formatted
        lines.join(', ')
      end

    end
  end
end
