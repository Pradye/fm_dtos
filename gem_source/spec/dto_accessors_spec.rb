require 'spec_helper'

describe DtoAccessors do
  subject(:dto) {TestReferenceDTO.new}

  describe '#timestamp_field' do
    before(:each) {allow(FmDtos).to receive(:time_zone).and_return('Melbourne')}
    class TestReferenceDTO
      include HashableDto

      timestamp_field :timestamp_attribute
    end

    let(:accessor) {timestamp_field}
    let(:datetime) {Time.now}
    subject(:setter) {dto.timestamp_attribute = value}

    describe 'a float number' do
      let(:value) {datetime.to_f}

      context 'setter' do
        subject {setter}

        it { is_expected.to eq(datetime.to_f)}
      end

      context 'getter' do
        before(:each) {setter}
        subject {dto.timestamp_attribute}

        it { is_expected.to be_within(0.001).of(value)}
      end

      context 'getter_as_datetime' do
        before(:each) {setter}
        subject {dto.timestamp_attribute_as_datetime}

        it { is_expected.to be_within(0.001).of(datetime)}
      end

      context 'getter_as_date' do
        before(:each) {setter}
        subject {dto.timestamp_attribute_as_date}

        it { is_expected.to be_within(0.001).of(datetime.to_date)}
      end
    end

    describe 'a integer number' do
      let(:value) {datetime.to_i}

      context 'setter' do
        subject {setter}

        it { is_expected.to eq(value)}
      end

      context 'getter' do
        before(:each) {setter}
        subject {dto.timestamp_attribute}

        it { is_expected.to eq(value)}
      end

      context 'getter_as_datetime' do
        before(:each) {setter}
        subject {dto.timestamp_attribute_as_datetime}

        it { is_expected.to be_within(1).of(datetime) }
      end

      context 'getter_as_date' do
        before(:each) {setter}
        subject {dto.timestamp_attribute_as_date}

        it { is_expected.to be_within(0.001).of(datetime.to_date)}
      end
    end

    describe 'a string number' do
      let(:value) {datetime.to_f.to_s}

      context 'setter' do
        subject {setter}

        it { is_expected.to eq(value)}
      end

      context 'getter' do
        before(:each) {setter}
        subject {dto.timestamp_attribute}

        it { is_expected.to be_within(0.001).of(datetime.to_f)}
      end

      context 'getter_as_datetime' do
        before(:each) {setter}
        subject {dto.timestamp_attribute_as_datetime}

        it { is_expected.to be_within(0.001).of(datetime)}
      end

      context 'getter_as_date' do
        before(:each) {setter}
        subject {dto.timestamp_attribute_as_date}

        it { is_expected.to be_within(0.001).of(datetime.to_date)}
      end
    end
  end
end
