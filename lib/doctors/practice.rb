module Doctors
  class Practice
    include Id::Model
    include Id::Form

    field :id
    field :code
    field :name
    field :latitude
    field :longitude
    field :distance
    field :gender,                 default: []
    field :phone,                  key: 'telephoneNumber'
    field :email,                  key: 'emailAddress'
    field :patient_count,          key: 'numberOfPatients'
    field :accepting_new_patients, key: 'acceptingNewPatients'
    field :online_prescriptions,   key: 'onlinePrescriptionOrdering'
    field :pims_url,               key: 'pimsUrl'
    field :opens_early,            key: 'opensEarly'
    field :opens_weekends,         key: 'opensWeekends'
    field :opens_late,             key: 'opensLate'

    has_one  :address,  type: Address
    has_many :services, type: Service

    def self.find(id)
      new API.find(id)
    end

    def to_param
      id
    end

    def has_female_gps?
      gender.include? 'female'
    end

    def has_male_gps?
      gender.include? 'male'
    end

  end
end
