require 'delegate'

module Doctors
  module Validations

    def self.included(base)
      base.extend(Descriptor)
    end

    module Descriptor
      delegate :validate,              to: :form_object
      delegate :validates,             to: :form_object
      delegate :validates!,            to: :form_object
      delegate :validates_each,        to: :form_object
      delegate :validates_with,        to: :form_object
    end
  end
end

