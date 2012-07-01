require 'treeton/grammar/json'

describe_rules_for 'Object' do
  it 'recognizes an empty object' do
    '{}'.should be_recognized
    ' { } '.should be_recognized
  end

  it 'recognizes objects with a single element' do
    %Q[{"key":"value" }].should be_recognized
    %Q[{"key" : 1234 }].should be_recognized
    %Q[ { "string"\n:\t1234 } ].should be_recognized
  end

  it 'recognizes objects with multiple elements' do
    %Q[{"k1":"v1", "k2":"v2"}].should be_recognized
    %Q[ { "k1":"v1" , "k2":["v1", "v2"], "k3" :234}].should be_recognized
  end

  it 'does not recognize objects with non-string keys' do
    %Q[{ 1234:"value" }].should_not be_recognized
  end
end
