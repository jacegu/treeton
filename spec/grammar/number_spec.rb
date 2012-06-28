require 'treeton/grammar/number'

describe_rules_for 'number' do
  let(:parser)  { NumberParser.new }

  it 'recognizes positive integers' do
    '0'.should be_recognized
    '1'.should be_recognized
    '3450'.should be_recognized
  end

  it 'recognizes negative integers' do
    '-4'.should be_recognized
    '-8420'.should be_recognized
  end

  it 'recognizes integers with exponents' do
    '1e0'.should be_recognized
    '122e4'.should be_recognized
    '1E101'.should be_recognized
  end

  it 'recognizes zero with an exponent' do
    '0e10'.should be_recognized
  end

  it 'does not recognize integers starting by 0' do
    '02'.should_not be_recognized
    '-010'.should_not be_recognized
  end

  it 'recognizes float numbers' do
    '0.1'.should be_recognized
    '4.02'.should be_recognized
    '-234.10000'.should be_recognized
  end

  it 'recognizes float numbers with exponents' do
    '-34.90234e33'.should be_recognized
    '124.124E2'.should be_recognized
  end

  it 'does not recognize floats without decimal part' do
    '2.'.should_not be_recognized
  end
end
