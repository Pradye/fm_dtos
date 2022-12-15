require 'spec_helper'

describe HashableDto do
  class TestReferenceDTO
    include HashableDto
    plain_field :entity_key
  end

  module TestHashableDTO
    class BaseDTO
      include HashableDto

      plain_field :entity_key
      plain_array_field :entity_keys
    end
    class TestDTO < BaseDTO
      plain_field :name
      plain_array_field :borrower_names
      integer_field :number
      integer_array_field :counts
      timestamp_field :updated_at
      timestamp_array_field :times
      datetime_field :decided_at
      datetime_array_field :decision_times
      date_field :dob
      date_array_field :movement_dates
      dollar_field :amount
      dollar_array_field :repayment_amounts
      decimal_field :rate
      decimal_array_field :previous_rates
      boolean_field :activated
      boolean_array_field :activations

      object_field :test_ref, TestReferenceDTO
      object_array_field :other_refs, TestReferenceDTO

      binary_field :content
      json_field :data
    end
  end

  let(:key){SecureRandom.uuid}
  let(:foreign_key){SecureRandom.uuid}
  let(:foreign_key_two){SecureRandom.uuid}
  let(:dto){TestHashableDTO::TestDTO.new}

  context 'with plain fields' do
    it 'should set the entity key on the dto' do
      dto.entity_key = key
      expect(dto.to_hash['entity_key']).to eq(key)
    end

    it 'should be able to go all the way to json and back to a dto object' do
      dto.entity_key = key

      dto2 = TestHashableDTO::TestDTO.new
      dto2.from_hash(JSON.parse(dto.to_hash.to_json))

      expect(dto2.entity_key).to eq(key)
    end
  end

  context 'with dollar fields' do
    it 'should get a dollar back when sent' do
      dto.amount = 500.55

      dto2 = TestHashableDTO::TestDTO.new
      dto2.from_hash(JSON.parse(dto.to_hash.to_json))

      expect(dto2.amount).to eq(BigDecimal("500.55"))
    end

    it 'should get money back if requested' do
      dto.amount = 500.55

      dto2 = TestHashableDTO::TestDTO.new
      dto2.from_hash(JSON.parse(dto.to_hash.to_json))

      expect(dto2.amount_as_money).to eq(Money.new(50055))
    end

    it 'should get dollars back even if set from money' do
      dto.amount = (500.55).to_money

      dto2 = TestHashableDTO::TestDTO.new
      dto2.from_hash(JSON.parse(dto.to_hash.to_json))

      expect(dto2.amount).to eq(BigDecimal("500.55"))
    end

    it 'should round to dollars if we send fractional cents' do
      dto.amount = BigDecimal("500.557")

      dto2 = TestHashableDTO::TestDTO.new
      dto2.from_hash(JSON.parse(dto.to_hash.to_json))

      expect(dto2.amount).to eq(BigDecimal("500.56"))
    end
  end

  context 'with integer fields' do
    it 'should return the value as an integer' do
      dto.number = 2

      dto2 = TestHashableDTO::TestDTO.new
      dto2.from_hash(JSON.parse(dto.to_hash.to_json))

      expect(dto2.number).to eq(2)
    end

    it 'should be possible to not send a value' do
      dto.number = nil

      dto2 = TestHashableDTO::TestDTO.new
      dto2.from_hash(JSON.parse(dto.to_hash.to_json))

      expect(dto2.number).to eq(nil)
    end

    it 'should not crash if we never set a value' do
      expect(dto.number).to eq(nil)
    end

    it 'should return an empty array if we never set a value on an array field' do
      expect(dto.counts).to eq([])
    end
  end

  context 'with timestamp fields' do
    it 'should convert a datetime to a floating point timestamp' do
      now = Time.now.utc
      dto.updated_at = now

      dto2 = TestHashableDTO::TestDTO.new
      dto2.from_hash(JSON.parse(dto.to_hash.to_json))

      expect(dto2.updated_at).to eq(now.to_f.round(5))
    end
  end

  context 'with boolean fields' do
    it 'should pass through true and false correctly' do
      dto.activated = true
      expect(dto.activated).to eq(true)
      dto.activated = false
      expect(dto.activated).to eq(false)
    end

    it 'should convert an object to a boolean true' do
      dto.activated = 'ok'

      expect(dto.activated).to eq(true)
    end

    it 'should not convert a nil to a boolean false' do
      dto.activated = nil

      expect(dto.activated).to eq(nil)
    end

    it 'should allow us to get the value using a question mark' do
      dto.activated = true

      expect(dto.activated?).to eq(true)
    end

    it 'should allow us to get nil as false using a question mark' do
      dto.activated = nil

      expect(dto.activated?).to eq(false)
    end
  end

  context 'with a foreign key reference' do
    it 'should set the foreign entity key on the dto hash' do
      dto.test_ref = TestReferenceDTO.new.tap{|l| l.entity_key = foreign_key}

      expect(dto.to_hash['test_ref']['entity_key']).to eq(foreign_key)
    end

    it 'should be able to get the foreign entity key back from the dto hash' do
      dto.test_ref = TestReferenceDTO.new.tap{|l| l.entity_key = foreign_key}

      received_dto = JSON.parse(dto.to_hash.to_json)

      expect(received_dto.to_hash['test_ref']['entity_key']).to eq(foreign_key)
    end

    it 'should be able to get the keys back from the dto object' do
      dto.from_hash({'test_ref' => {'entity_key' => foreign_key}})

      expect(dto.test_ref.entity_key).to eq(foreign_key)
    end

    it 'should be able to go all the way to json and back to a dto object' do
      dto.test_ref = TestReferenceDTO.new.tap{|l| l.entity_key = foreign_key}

      dto2 = TestHashableDTO::TestDTO.new
      dto2.from_hash(JSON.parse(dto.to_hash.to_json))

      expect(dto2.test_ref.entity_key).to eq(foreign_key)
    end

    it 'should return nil if the object was not set' do
      expect(dto.test_ref).to eq(nil)
    end
  end

  context 'setting an array of string elements' do
    it 'should be able to go all the way to json and back to a dto object' do
      dto.borrower_names = %w(abc def ghi)

      dto2 = TestHashableDTO::TestDTO.new
      dto2.from_hash(JSON.parse(dto.to_hash.to_json))

      expect(dto2.borrower_names).to eq(%w(abc def ghi))
    end
  end

  context 'setting an array of simple (eg integer) elements' do
    it 'should be able to go all the way to json and back to a dto object' do
      dto.counts = ['5',4.1,3,2]

      dto2 = TestHashableDTO::TestDTO.new
      dto2.from_hash(JSON.parse(dto.to_hash.to_json))

      expect(dto2.counts).to eq([5,4,3,2])
    end
  end

  context 'setting an array of timestamp elements' do
    it 'should be able to go all the way to json and back to a dto object' do
      now = Time.now
      earlier = now - 600

      dto.times = [now, earlier]

      dto2 = TestHashableDTO::TestDTO.new
      dto2.from_hash(JSON.parse(dto.to_hash.to_json))

      expect(dto2.times).to eq([now.to_f.round(5), earlier.to_f.round(5)])
    end
  end

  context 'setting an array of object elements' do
    it 'should be able to go all the way to json and back to a dto object' do
      l1 = TestReferenceDTO.new.tap{|l| l.entity_key = foreign_key}
      l2 = TestReferenceDTO.new.tap{|l| l.entity_key = foreign_key_two}
      dto.other_refs = [l1, l2]

      dto2 = TestHashableDTO::TestDTO.new
      dto2.from_hash(JSON.parse(dto.to_hash.to_json))

      expect(dto2.other_refs.size).to eq(2)
      expect(dto2.other_refs[0]).to be_a(TestReferenceDTO)
      expect(dto2.other_refs[0].entity_key).to eq(foreign_key)
      expect(dto2.other_refs[1].entity_key).to eq(foreign_key_two)
    end

    it 'should return an empty array if none was set' do
      expect(dto.other_refs).to eq([])
    end
  end

  it 'should raise an exception if we try to access an element that does not exist' do
    expect{dto.no_way}.to raise_error(NoMethodError)
  end


  context 'binary_field' do
    let(:file_content) {'file content'}
    subject {TestHashableDTO::TestDTO.new.tap{|l| l.content = file_content}}

    it {expect(subject.content).to eq("ZmlsZSBjb250ZW50\n")}
    it {expect(subject.content_decoded).to eq(file_content)}
  end

  context 'json_field' do
    let(:data) {{'a' =>  1, 'b' => 2}}
    let(:dto)  {TestHashableDTO::TestDTO.new.tap{|l| l.data = data}}

    describe 'Hash' do
      subject {dto}

      it {expect(subject.data['a']).to eq(1)}
      it {expect(subject.data['b']).to eq(2)}
    end

    describe 'Json String' do
      let(:dto2)  {TestHashableDTO::TestDTO.new}

      it 'should be parsed properly' do
        json  = JSON.parse(dto.to_hash.to_json)
        dto2.from_hash(json)

        expect(dto2.data['a']).to eq(1)
        expect(dto2.data['b']).to eq(2)
      end
    end
  end

  describe 'defined_fields' do

    let(:dto)  {TestHashableDTO::TestDTO}

    subject {dto.defined_fields}

    it {is_expected.to eq([
          [:plain_field, :name, nil],
          [:plain_array_field, :borrower_names, nil],
          [:integer_field, :number, nil],
          [:integer_array_field, :counts, nil],
          [:timestamp_field, :updated_at, nil],
          [:timestamp_array_field, :times, nil],
          [:datetime_field, :decided_at, nil],
          [:datetime_array_field, :decision_times, nil],
          [:date_field, :dob, nil],
          [:date_array_field, :movement_dates, nil],
          [:dollar_field, :amount, nil],
          [:dollar_array_field, :repayment_amounts, nil],
          [:decimal_field, :rate, nil],
          [:decimal_array_field, :previous_rates, nil],
          [:boolean_field, :activated, nil],
          [:boolean_array_field, :activations, nil],
          [:object_field, :test_ref, TestReferenceDTO],
          [:object_array_field, :other_refs, TestReferenceDTO],
          [:binary_field, :content, nil],
          [:json_field, :data, nil],
        ])
      }
  end
end
