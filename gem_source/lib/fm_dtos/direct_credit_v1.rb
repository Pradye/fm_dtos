module FmDtos
  class DirectCreditV1
    include FmDtos::FmEntityDtoV1
    def self.dto_version; 1 end

    object_field :financier_ref, FmDtos::GenericReferenceV1

    dollar_field :amount

    plain_field :status_code

    plain_field :funds_type_code
    plain_field :type_code_additional_fields

    plain_field :banking_reference_number
    plain_field :customer_reference_number
    object_field :customer_bank_account, FmDtos::BankAccountV1
    plain_field :fallback_reference_number
    plain_field :text_field

    plain_field :failed_by_username
    timestamp_field :failure_timestamp
  end
end
