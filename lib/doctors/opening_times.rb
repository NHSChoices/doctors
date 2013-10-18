class OpeningTimes
  include Id::Model

  field :day_of_week, key: 'dayOfWeek'
  field :opening_time, key: 'openingTime'
  field :closing_time, key: 'closingTime'

  def day
    case day_of_week
    when 1 then "Monday"
    when 2 then "Tuesday"
    when 3 then "Wednesday"
    when 4 then "Thursday"
    when 5 then "Friday"
    when 6 then "Saturday"
    when 0 then "Sunday"
    end
  end

end
