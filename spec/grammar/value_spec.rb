require 'treeton/grammar/value'

describe_rules_for 'value' do
  it_recognizes 'true'
  it_recognizes 'false'
  it_recognizes 'null'
end
