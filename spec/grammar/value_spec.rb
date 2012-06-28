require 'treeton/grammar/value'

describe_rules_for 'value' do
  let(:parser) { ValueParser.new }

  it_recognizes 'true'
  it_recognizes 'false'
  it_recognizes 'null'
end
