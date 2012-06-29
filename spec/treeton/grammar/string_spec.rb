require 'treeton/grammar/string'

describe_rules_for 'string' do
  let(:parser) { Treeton::StringParser.new }

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

    it "recoginzes strings with whitespace around" do
      %Q{ \n\t"string" \n\r }.should be_recognized
    end
  end
end
