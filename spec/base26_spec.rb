# frozen_string_literal: true

RSpec.describe Base26 do
  values = { 'a' => 1, 'z' => 26, 'aa' => 27, 'az' => 52, 'ba' => 53, 'zyx' => 18_250, 'abc' => 731 }

  it 'has a version number' do
    expect(Base26::VERSION).not_to be nil
  end

  describe '.to_int' do
    subject { described_class.to_int(value) }

    context 'when value is not an alpha' do
      let(:value) { '123' }

      it { expect { subject }.to raise_error(ArgumentError, 'Value not a valid Base26 String') }
    end

    context 'with upcase string' do
      let(:value) { 'aA' }

      it { is_expected.to eq 27 }
    end

    context 'with downcase string' do
      let(:value) { 'aa' }

      it { is_expected.to eq 27 }
    end

    context 'with more values' do
      values.each do |k, v|
        it { expect(described_class.to_int(k)).to eq v }
      end
    end
  end

  describe '.to_alpha' do
    subject { described_class.to_alpha(value) }

    context 'when value is not integer' do
      let(:value) { 'abc' }

      it { expect { subject }.to raise_error(ArgumentError, 'Value passed is not an Integer.') }
    end

    context 'when value is lower than 1' do
      let(:value) { 0 }

      it { is_expected.to eq '' }
    end

    context 'with more values' do
      values.each do |k, v|
        it { expect(described_class.to_alpha(v)).to eq k }
      end
    end
  end

  describe 'to int and back' do
    it 'should be the same' do
      alpha = 'abc'
      int = described_class.to_int(alpha)
      expect(described_class.to_alpha(int)).to eq alpha
    end
  end

  describe 'to alpha and back' do
    it 'should be the same' do
      int = 123
      alpha = described_class.to_alpha(int)
      expect(described_class.to_int(alpha)).to eq int
    end
  end

end
