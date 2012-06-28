require 'treeton/grammar/string'

describe_rules_for 'string' do
  let(:parser) { JsonStringParser.new }

  it 'recognizes an empty string' do
    '""'.should be_recognized
  end

  context 'escaped characters' do
    it 'recognizes an escaped quotation mark' do
      %q{"\""}.should be_recognized
    end

    it 'recognizes a solidus' do
      %q{"\/"}.should be_recognized
    end

    it 'recognizes a reverse solidus' do
      %q{"\\\\"}.should be_recognized
    end

    it 'recognizes a backspace' do
      %q{"\b"}.should be_recognized
    end

    it 'recognizes a formfeed' do
      %q{"\f"}.should be_recognized
    end

    it 'recognizes a newline' do
      %q{"\n"}.should be_recognized
    end

    it 'recognizes a carriage return' do
      %q{"\r"}.should be_recognized
    end

    it 'recognizes a horizontal tab' do
      %q{"\t"}.should be_recognized
    end
  end

  context 'charaters by hexadecimal code' do
    it 'recognizes valid hexadecimal numbers' do
      %q{"\u0000"}.should be_recognized
      %q{"\u00ff"}.should be_recognized
      %q{"\uA24b"}.should be_recognized
      %q{"\uFfFf"}.should be_recognized
    end

    it 'does not recognize hexadicimal numbers with less than 4 digits' do
      %q{"\uF"}.should_not be_recognized
    end
  end
end
