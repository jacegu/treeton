require 'treeton/grammar/array'

describe_rules_for 'Array' do
  let(:parser) { Treeton::ArrayParser.new }

  it 'recognizes an empty array' do
    '[]'.should be_recognized
  end

  it 'recognizes an array with a single value' do
    '[1024]'.should be_recognized
  end

  it 'recognizes multiple values' do
    '[1,2]'.should be_recognized
    '["a", "b"]'.should be_recognized
    '["str"  ,  "ing"]'.should be_recognized
    '[null, true, false, 334, "array"]'.should be_recognized
  end
end
