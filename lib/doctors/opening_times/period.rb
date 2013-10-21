class OpeningTimes
  class Period
    include Id::Model

    field :type
    field :day
    field :opens
    field :closes

    def reception?
      type == "Reception"
    end

    def surgery?
      type == "Surgery"
    end

  end
end