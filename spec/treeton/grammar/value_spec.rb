require 'treeton/grammar/value'

describe_rules_for 'values' do
  let(:parser) { Treeton::ValueParser.new }

  it_recognizes 'true'
  it_recognizes 'false'
  it_recognizes 'null'
  it_recognizes '1000'
  it_recognizes '"a\tfull-string\n\u4AB0\""'
  it_recognizes '[1, "array", true, false, null]'
  it_recognizes '{ "thingy":[1, "two", 3], "more": [null, false, true] }'
end
