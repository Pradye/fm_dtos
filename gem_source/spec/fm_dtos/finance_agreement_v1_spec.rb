require 'spec_helper'

describe FmDtos::FinanceAgreementV1 do
  let(:agreement) do
    agreement = FmDtos::FinanceAgreementV1.new
    agreement.originating_business_partner = FmDtos::BusinessPartnerV1.new
    agreement.originating_business_partner.name = 'dealer_name 1'
    agreement.originating_business_partner.address.state_or_region = 'state_code 1'
    agreement.originating_business_partner.phone = 'phone 1'
    agreement.originating_business_partner.acn = 'acn 1'
    agreement.originating_business_partner.address.formatted_line_1_of_3 = 'address line 1'
    agreement.originating_business_partner.address.formatted_line_2_of_3 = 'address line 2'
    agreement.originating_business_partner.dealership_number = 'code 1'
    agreement
  end

  describe '#originating_business_partner should default empty if not set explicitly' do
    let(:agreement) { FmDtos::FinanceAgreementV1.new }
    it { expect(agreement.originating_business_partner).to be_present }
  end

  describe '#originating_business_partner_name is deprecated as originating_business_partner.name' do
    it 'get value on old field receives value from the new' do
      expect(agreement.originating_business_partner_name).to eq('dealer_name 1')
    end
    it 'set value on new field sets the value of the new' do
      expect { agreement.originating_business_partner_name = 'test' }.to change {
        agreement.originating_business_partner.name
      }.from('dealer_name 1').to('test')
    end
  end

  describe '#originating_business_partner_state_key is deprecated as originating_business_partner.address.state_or_region' do
    it 'get value on old field receives value from the new' do
      expect(agreement.originating_business_partner_state_key).to eq('state_code 1')
    end
    it 'set value on new field sets the value of the new' do
      expect { agreement.originating_business_partner_state_key = 'test' }.to change {
        agreement.originating_business_partner.address.state_or_region
      }.from('state_code 1').to('test')
    end
  end

  describe '#originating_business_partner_phone_number is deprecated as originating_business_partner.phone' do
    it 'get value on old field receives value from the new' do
      expect(agreement.originating_business_partner_phone_number).to eq('phone 1')
    end
    it 'set value on new field sets the value of the new' do
      expect { agreement.originating_business_partner_phone_number = 'test' }.to change {
        agreement.originating_business_partner.phone
      }.from('phone 1').to('test')
    end
  end

  describe '#originating_business_partner_acn is deprecated as originating_business_partner.acn' do
    it 'get value on old field receives value from the new' do
      expect(agreement.originating_business_partner_acn).to eq('acn 1')
    end
    it 'set value on new field sets the value of the new' do
      expect { agreement.originating_business_partner_acn = 'test' }.to change {
        agreement.originating_business_partner.acn
      }.from('acn 1').to('test')
    end
  end

  describe '#originating_business_partner_address_line_one is deprecated as originating_business_partner.address.formatted_line_1_of_3' do
    it 'get value on old field receives value from the new' do
      expect(agreement.originating_business_partner_address_line_one).to eq('address line 1')
    end
    it 'set value on new field sets the value of the new' do
      expect { agreement.originating_business_partner_address_line_one = 'test' }.to change {
        agreement.originating_business_partner.address.formatted_line_1_of_3
      }.from('address line 1').to('test')
    end
  end

  describe '#originating_business_partner_address_line_two is deprecated as originating_business_partner.address.formatted_line_2_of_3' do
    it 'get value on old field receives value from the new' do
      expect(agreement.originating_business_partner_address_line_two).to eq('address line 2')
    end
    it 'set value on new field sets the value of the new' do
      expect { agreement.originating_business_partner_address_line_two = 'test' }.to change {
        agreement.originating_business_partner.address.formatted_line_2_of_3
      }.from('address line 2').to('test')
    end
  end

  describe '#originating_business_partner_code is deprecated as originating_business_partner.dealership_number' do
    it 'get value on old field receives value from the new' do
      expect(agreement.originating_business_partner_code).to eq('code 1')
    end
    it 'set value on new field sets the value of the new' do
      expect { agreement.originating_business_partner_code = 'test' }.to change {
        agreement.originating_business_partner.dealership_number
      }.from('code 1').to('test')
    end
  end
end
