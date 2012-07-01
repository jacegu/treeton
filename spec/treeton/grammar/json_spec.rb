require 'treeton/grammar/json'

describe_rules_for 'values' do
  let(:parser) { Treeton::JsonParser.new }

  it_recognizes '[1, "array", true, false, null]'
  it_recognizes '{ "thingy":[1, "two", 3], "more": [null, false, true] }'

  #all this aren't valid JSON: only arrays and objects can be at the top level
  it_does_not_recognize 'true'
  it_does_not_recognize 'false'
  it_does_not_recognize 'null'
  it_does_not_recognize '1000'
  it_does_not_recognize '"a\tfull-string\n\u4AB0\""'

end
