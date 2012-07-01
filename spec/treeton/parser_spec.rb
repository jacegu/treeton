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
end
