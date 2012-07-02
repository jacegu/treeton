require 'treeton/grammar/value'

describe_rules_for 'string' do
  let(:parser) { Treeton::ValueParser.new }

  context 'escaped characters' do
    it 'recognizes an escaped quotation mark' do
      %q{"\""}.should be_recognized
    end

    it 'recognizes a solidus' do
      %Q{"\/"}.should be_recognized
    end

    it 'recognizes a reverse solidus' do
      %Q{"\\\\"}.should be_recognized
    end

    it 'recognizes a backspace' do
      %Q{"\b"}.should be_recognized
    end

    it 'recognizes a formfeed' do
      %Q{"\f"}.should be_recognized
    end

    it 'recognizes a newline' do
      %Q{"\n"}.should be_recognized
    end

    it 'recognizes a carriage return' do
      %Q{"\r"}.should be_recognized
    end

    it 'recognizes a horizontal tab' do
      %Q{"\t"}.should be_recognized
    end
  end

  context 'charaters by hexadecimal code' do
    it 'recognizes valid hexadecimal numbers' do
      %Q{"\u0000"}.should be_recognized
      %Q{"\u00ff"}.should be_recognized
      %Q{"\uA24b"}.should be_recognized
      %Q{"\uFfFf"}.should be_recognized
    end

    it 'does not recognize hexadicimal numbers with less than 4 digits' do
      %q{"\uF"}.should_not be_recognized
    end
  end

  context 'regular characters' do
    it 'does not recognize "\"' do
      %q{"\\"}.should_not be_recognized
    end

    it 'does not recognize """' do
      %q{"""}.should_not be_recognized
    end

    it 'recognizes any other unicode character' do
      %q{"a"}.should be_recognized
      %q{"Z"}.should be_recognized
      %q{"5"}.should be_recognized
    end

    it 'does not recognize control characters' do
      %q{"\a"}.should_not be_recognized
    end
  end

  context 'strings' do
    it 'recognizes an empty string' do
      '""'.should be_recognized
    end

    it 'recognizes plain strings' do
      %q{"This IS a PLAIN string"}.should be_recognized
      %q{"1234567890"}.should be_recognized
      %q{"-0.1239e10"}.should be_recognized
      %q{"2 times TWO = four"}.should be_recognized
    end

    it 'recognizes strings with escaped characters' do
      %q{"\tnew\n\tline\\\r\n"}.should be_recognized
    end

    it 'recognizes strings with characters by hexadecimal code' do
      %q{"\u234F this and \u8840 is \u2343 \r\n"}.should be_recognized
    end
  end
end
