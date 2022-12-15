module FmDtos
  class TradeReferenceV1
    include FmDtos::FmEntityDtoV1
    def self.dto_version; 1 end

    integer_field :position # aka number aka index

    plain_field :company_name
    plain_field :contact_person_name

    dollar_field :average_monthly_expenditure
    plain_field :terms_of_payment

    plain_field :primary_phone_number
  end
end

