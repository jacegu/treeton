require 'treeton/grammar/whitespace'

describe_rules_for 'whitespace' do
  let(:parser) { Treeton::WhitespaceParser.new }

  it 'recognizes spaces' do
    ' '.should be_recognized
  end

  it 'recognizes new lines' do
    "\n".should be_recognized
  end

  it 'recognizes carriage returns' do
    "\r".should be_recognized
  end

  it 'recognizes tabs' do
    "\t".should be_recognized
  end

  it 'does not recognize linefeed' do
    "\f".should_not be_recognized
  end
end
