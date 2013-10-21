require 'spec_helper'

describe  OpeningTimes::Period do

  it 'know it has Reception type' do
    period =  OpeningTimes::Period.new(type: "Reception")
    expect(period).to be_reception
    expect(period).to_not be_surgery
  end

  it 'know it has Surgery type' do
    period =  OpeningTimes::Period.new(type: "Surgery")
    expect(period).to be_surgery
    expect(period).to_not be_reception
  end
end
