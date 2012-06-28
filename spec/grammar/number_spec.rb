require 'treeton/grammar/number'

describe_rules_for 'number' do
  it 'recognizes positive integers' do
    '1'.should be_recognized
    '3450'.should be_recognized
  end

  it 'recognizes negative integers' do
    '-4'.should be_recognized
    '-8420'.should be_recognized
  end

  it 'does not recognize integers starting by 0' do
    '02'.should_not be_recognized
  end

  it 'recognizes integers with exponents' do
    '1e2'.should be_recognized
    '1E10'.should be_recognized
  end
end
