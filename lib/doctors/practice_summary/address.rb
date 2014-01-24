module Doctors
  class PracticeSummary
    class Address
      include Id::Model

      field :lines, key: 'addressLine'
      field :postcode
    end
  end
end
