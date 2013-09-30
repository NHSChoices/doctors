require 'delegate'

module Doctors
  module Validations

    delegate :validate,              to: :form_object
    delegate :validates,             to: :form_object
    delegate :validates!,            to: :form_object
    delegate :validates_each,        to: :form_object
    delegate :validates_with,        to: :form_object
    delegate :validates_presence_of, to: :form_object
  end
end

