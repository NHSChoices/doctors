class OpeningTimes
  include Id::Model

  field :opens_early,            key: 'opensEarly'
  field :opens_weekends,         key: 'opensWeekends'
  field :opens_late,             key: 'opensLate'

  has_many :periods, type: Period, key: 'times'

  def reception
    periods.select(&:reception?)
  end

  def surgery
    periods.select(&:surgery?)
  end
end