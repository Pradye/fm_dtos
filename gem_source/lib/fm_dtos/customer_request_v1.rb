module FmDtos
  class CustomerRequestV1
    include FmDtos::FmEntityDtoV1
    def self.dto_version; 1 end

    plain_field :request_type # generate_statement, change_legal_entity, change_contract, change_bank_account, add_bank_account
    plain_field :contract_number
    plain_field :status_code

    date_field :payout_quote_effective_date
    date_field :direct_debit_date
    decimal_field :direct_debit_amount
    integer_field :direct_debit_count

    plain_field :customer_number
    object_field :bank_account, FmDtos::BankAccountV1
    object_array_field :supporting_documents, FmDtos::ContractDocumentV1

    object_field :customer_changes, FmDtos::CustomerV1

    object_field :hardship_request, FmDtos::CustomerRequestHardshipV1

    plain_field :note

    # object_field :retail_contract_ref, FmDtos::GenericReferenceV1
    # object_field :legal_entity_ref, FmDtos::GenericReferenceV1
  end
end
