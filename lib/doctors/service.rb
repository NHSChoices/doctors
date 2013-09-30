module Doctors
  class Service
    include Id::Model

    field :id, key: 'serviceID'
    field :name, key: 'serviceName'
  end
end
