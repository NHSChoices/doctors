require 'spec_helper'

describe OpeningTimes do

  let (:opening_times){OpeningTimes.new(times: [{type: "Reception"},{type: "Surgery"}])}

  it 'has Reception times' do
    expect(opening_times.reception).to have(1).item
    expect(opening_times.reception.first.type).to eq "Reception"
  end

  it 'has Surgery times' do
    expect(opening_times.surgery).to have(1).item
    expect(opening_times.surgery.first.type).to eq "Surgery"
  end
end
