require 'spec_helper'
require 'color'

describe ColorGradient do
  it 'has a version number' do
    expect(ColorGradient::VERSION).not_to be nil
  end

  subject { described_class.new(start, stop, resolution) }

  let(:start) { Color::RGB.new(0, 0, 0) }
  let(:stop) { Color::RGB.new(255, 255, 255) }
  let(:resolution) { 7 }

  context 'initializer' do
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

  context 'generated results' do
    let(:results) { [
        start,
        Color::RGB.by_hex('242424'),
        Color::RGB.by_hex('494949'),
        Color::RGB.by_hex('6d6d6d'),
        Color::RGB.by_hex('929292'),
        Color::RGB.by_hex('b6b6b6'),
        Color::RGB.by_hex('dbdbdb'),
        stop
    ] }

    context '.gradient' do
      subject { described_class.new(start, stop, resolution) }

      it 'step 0 matches start' do
        expect(subject.gradient(0)).to eq start
      end

      it 'step 7 matches stop' do
        expect(subject.gradient(7)).to eq stop
      end

      it 'step 1 matches #242424' do
        expect(subject.gradient(1)).to eq results[1]
      end

      it 'step 2 matches #494949' do
        expect(subject.gradient(2)).to eq results[2]
      end

      it 'step 3 matches #6d6d6d' do
        expect(subject.gradient(3)).to eq results[3]
      end

      it 'step 4 matches #929292' do
        expect(subject.gradient(4)).to eq results[4]
      end

      it 'step 5 matches #b6b6b6' do
        expect(subject.gradient(5)).to eq results[5]
      end

      it 'step 6 matches #dbdbdb' do
        expect(subject.gradient(6)).to eq results[6]
      end
    end

    context 'Enumerable' do
      subject { described_class.new(start, stop, resolution) }

      it '.each returns array of results' do
        expect(subject.each).to match_array results
      end

      it '.first returns the first colour' do
        expect(subject.first).to eq start
      end

      it '.last returns the last colour' do
        expect(subject.last).to eq stop
      end

      it '[0] returns 1st colour' do
        expect(subject[0]).to eq results[0]
      end

      it '[1] returns 2nd colour' do
        expect(subject[1]).to eq results[1]
      end

      it '[2] returns 3rd colour' do
        expect(subject[2]).to eq results[2]
      end

      it '[3] returns 4th colour' do
        expect(subject[3]).to eq results[3]
      end

      it '[4] returns 5th colour' do
        expect(subject[4]).to eq results[4]
      end

      it '[5] returns 6th colour' do
        expect(subject[5]).to eq results[5]
      end

      it '[6] returns 7th colour' do
        expect(subject[6]).to eq results[6]
      end

      it '[7] returns 8th colour' do
        expect(subject[7]).to eq results[7]
      end
    end
  end
end
