require 'treeton/grammar/value'

describe_rules_for 'Object' do
  let(:parser) { Treeton::ValueParser.new }

  it 'recognizes an empty object' do
    '{}'.should be_recognized
    ' { } '.should be_recognized
  end
end
