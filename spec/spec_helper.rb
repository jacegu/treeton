require 'treetop'

RSpec::Matchers.define :be_recognized do
  match do |text|
    not parser.parse(text).nil?
  end

  description do |text|
    %Q'recognize "#{text}"'
  end

  failure_message_for_should do |text|
    %Q'expected "#{text}" to be recognized by grammar rules'
  end
end

def describe_rules_for(rule, &grammar_spec)
  describe "recognizing #{rule}" do
    let(:grammar) { 'Json' }
    let(:parser)  { JsonParser.new }
    instance_eval &grammar_spec
  end
end

module GrammarExpectations
  def it_recognizes(text)
    it { text.should be_recognized }
  end

  def xit_recognizes(text)
    xit { text.should be_recognized }
  end
end

RSpec::configure do |config|
  config.extend(GrammarExpectations)
end
