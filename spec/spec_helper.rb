require 'treetop'

RSpec::Matchers.define :be_recognized do
  match do |text|
    not parser.parse(text).nil?
  end

  description do |text|
    "recognize #{text}"
  end

  failure_message_for_should do |text|
    "expected #{text} to be recognized by grammar rules"
  end
end

RSpec::Matchers.define :be_translated_to do |translation|
  match do |text|
    parser.parse(text).translate == translation
  end

  description do |text|
    "translate #{text} into #{translation.inspect}"
  end

  failure_message_for_should do |text|
    "expected #{text} to be translated into #{translation.inspect}"
  end
end

def describe_rules_for(rule, &grammar_spec)
  describe "recognizing #{rule}" do
    let(:parser) { Treeton::JsonParser.new }
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
