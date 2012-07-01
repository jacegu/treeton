require 'treeton/grammar/value'
require 'treeton/nodes/terminal_nodes'

describe 'Terminal Nodes' do
  let(:parser) { Treeton::ValueParser.new }

  describe Treeton::Nodes::NumberNode do
    it 'should be translated to the number' do
      '0'.should be_translated_to 0
      '0.5e2'.should be_translated_to 50.0
      '-40e1'.should be_translated_to -400
    end
  end

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
