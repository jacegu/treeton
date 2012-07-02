require 'treeton/parser'

describe Treeton::Parser do
  subject              { Treeton::Parser.new(treetop_parser) }
  let(:treetop_parser) { stub :treetop_parser }
  let(:ast)            { stub(:abstract_syntax_tree) }

  it 'parses and translates the input' do
    treetop_parser.stub(:parse).with('null').and_return ast
    ast.stub(:translate).and_return(nil)
    subject.parse('null').should be nil
  end

  it 'raises a SyntaxError if the input cannot be parsed' do
    treetop_parser.stub(:failure_reason).and_return('parse failed message')
    treetop_parser.stub(:parse).and_return nil
    expect { subject.parse('not json') }.to raise_error Treeton::SyntaxError
  end
end
