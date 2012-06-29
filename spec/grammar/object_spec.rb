require 'treeton/grammar/value'

describe_rules_for 'Object' do
  let(:parser) { Treeton::ValueParser.new }

  it 'recognizes an empty object' do
    '{}'.should be_recognized
    ' { } '.should be_recognized
  end

  it 'recognizes a object with a single element' do
    %Q[{"key":"value" }].should be_recognized
    %Q[{"key" : 1234 }].should be_recognized
    %Q[ { "string"\n:\t1234 } ].should be_recognized
  end
end
