require 'treetop'

RSpec::Matchers.define :be_recognized_by do |grammar|
  match do |text|
    not parser.parse(text).nil?
  end

  description do |text|
    %Q'recognize "#{text}"'
  end

  failure_message_for_should do |text|
    %Q'expected #{grammar} to recognize "#{text}"'
  end

  def parser
    parser_class.new
  end

  def parser_class
    Kernel.const_get("#{grammar}Parser")
  end
end

def describe_rules_for(rule, &grammar_spec)
  describe "recognizing #{rule}" do
    let(:grammar) { 'Json' }
    instance_eval &grammar_spec
  end
end

module GrammarExpectations
  def it_recognizes(text)
    it { text.should be_recognized_by grammar }
  end

  def xit_recognizes(text)
    xit { text.should be_recognized_by grammar }
  end
end

RSpec::configure do |config|
  config.extend(GrammarExpectations)
end
