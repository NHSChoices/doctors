module Doctors
  class Address
    include Id::Model
    include Enumerable

    field :line_one,   key: 'addressLine1'
    field :line_two,   key: 'addressLine2'
    field :line_three, key: 'addressLine3'
    field :city
    field :county
    field :postcode,   key: 'postCode'

    def each(&block)
      lines.each(&block)
    end

    def lines
      [line_one, line_two, line_three, city, county, postcode].reject(&:blank?)
    end

    def formatted
      lines.join(', ')
    end

  end
end
