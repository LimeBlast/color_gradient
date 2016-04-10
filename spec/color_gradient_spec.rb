require 'spec_helper'
require 'color'

describe ColorGradient do
  it 'has a version number' do
    expect(ColorGradient::VERSION).not_to be nil
  end

  context 'initializer' do
    subject { described_class.new(start, stop, resolution) }

    let(:start) { Color::RGB.new(0, 0, 0) }
    let(:stop) { Color::RGB.new(255, 255, 255) }
    let(:resolution) { 12 }

    context 'when using valid arguments' do
      it 'returns a ColorGradient object' do
        expect(subject).to be_instance_of ColorGradient
      end
    end

    context 'when not using Color gem for `start` argument' do
      let(:start) { 'red' }

      it 'raises an ArgumentError' do
        expect { subject }.to raise_error ArgumentError, 'start Argument is not Color gem object'
      end
    end

    context 'when not using Color gem for `stop` argument' do
      let(:stop) { 'red' }

      it 'raises an ArgumentError' do
        expect { subject }.to raise_error ArgumentError, 'stop Argument is not Color gem object'
      end
    end

    context 'when not using integer for `resolution` argument' do
      let(:resolution) { 'twelve' }

      it 'raises an ArgumentError' do
        expect { subject }.to raise_error ArgumentError, 'resolution Argument is not integer'
      end
    end
  end

  context '.gradient' do
    subject { described_class.new(start, stop, resolution) }

    let(:start) { Color::RGB.new(0, 0, 0) }
    let(:stop) { Color::RGB.new(255, 255, 255) }
    let(:resolution) { 7 }

    it 'step 0 matches start' do
      expect(subject.gradient(0)).to eq start
    end

    it 'step 7 matches stop' do
      expect(subject.gradient(7)).to eq stop
    end

    it 'step 1 matches #242424' do
      expect(subject.gradient(1)).to eq Color::RGB.by_hex('242424')
    end

    it 'step 2 matches #494949' do
      expect(subject.gradient(2)).to eq Color::RGB.by_hex('494949')
    end

    it 'step 3 matches #6d6d6d' do
      expect(subject.gradient(3)).to eq Color::RGB.by_hex('6d6d6d')
    end

    it 'step 4 matches #929292' do
      expect(subject.gradient(4)).to eq Color::RGB.by_hex('929292')
    end

    it 'step 5 matches #b6b6b6' do
      expect(subject.gradient(5)).to eq Color::RGB.by_hex('b6b6b6')
    end

    it 'step 6 matches #dbdbdb' do
      expect(subject.gradient(6)).to eq Color::RGB.by_hex('dbdbdb')
    end
  end
end
