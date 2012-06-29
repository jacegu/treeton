require 'treeton/grammar/value'

describe_rules_for 'Array' do
  let(:parser) { Treeton::ValueParser.new }

  it 'recognizes an empty array' do
    '[]'.should be_recognized
  end

  it 'recognizes an array with a single value' do
    '[1024]'.should be_recognized
    ' [ "array" ] '.should be_recognized
  end

  it 'recognizes multiple values' do
    '[1,2]'.should be_recognized
    '["a", "b"]'.should be_recognized
    %Q{\n\t["str"  ,  "ing"\n\t] }.should be_recognized
    '[null, true, false, 334, "array"]'.should be_recognized
  end

  it 'recognizes arrays of arrays' do
    '[[1], [2], ["a", false]]'.should be_recognized
  end
end
