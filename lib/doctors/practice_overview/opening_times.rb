# These classes are horrible because the structure of the data
# coming back from syndication is AWFUL.

module Doctors
  class PracticeOverview
    class OpeningTimes

      class TimePeriod
        include Id::Model
        field :period, key: 'timesSession'

        def from
          period['fromTime']
        end

        def to
          period['toTime']
        end
      end

      class Day
        include Id::Model
        field :name, key: 'dayName'
        has_one :time_period, key: 'timesSessions'
      end

      class Session
        include Id::Model
        field :type, key: 'sessionType'
        field :days_data, key: 'daysOfWeek'

        def days
          @days ||= days_data['dayOfWeek'].map(&Day)
        end
      end
    end

    class OpeningTimes
      include Id::Model
      field :session_data, key: 'timesSessionTypes', default: Hash.new

      def sessions
        @sessions ||= session_data.fetch('timesSessionType', []).map(&Session)
      end

      def session_map
        sessions.group_by(&:type)
      end

      def reception
        session_map['reception']
      end

      def surgery
        session_map['surgery']
      end

    end

  end
end
