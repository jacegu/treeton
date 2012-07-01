require 'treeton/parser'
require 'treeton/nodes/terminal_nodes'

describe 'Terminal Nodes' do
  let(:parser) { Treeton::JsonParser.new }

  describe Treeton::Nodes::TrueNode do
    it 'should be translated to true' do
      'true'.should be_translated_to true
    end
  end

  describe Treeton::Nodes::FalseNode do
    it 'should be translated to false' do
      'false'.should be_translated_to false
    end
  end

  describe Treeton::Nodes::NilNode do
    it 'should be translated to nil' do
      'null'.should be_translated_to nil
    end
  end
end
