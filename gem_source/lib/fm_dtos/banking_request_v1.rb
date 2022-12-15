module FmDtos
  class BankingRequestV1
    include FmDtos::FmEntityDtoV1
    def self.dto_version; 1 end

    object_field :financier_ref, FmDtos::GenericReferenceV1

    plain_field :other_party_type
    plain_field :other_party_name
    object_field :other_party_ref, FmDtos::GenericReferenceV1

    timestamp_field :bank_submission_timestamp
    timestamp_field :bank_acknowledgement_timestamp
    timestamp_field :failure_timestamp
    timestamp_field :bank_return_timestamp
    timestamp_field :bank_processing_timestamp

    boolean_field :allow_consolidation
    boolean_field :allow_direct_debit
    boolean_field :funds_go_from_financier_to_other_party # Just being verbose to be extra clear about which direction the money is flowing in. This flag is true for disbursements (including commissions) and refunds

    boolean_field :reversed
    plain_field :status_code

    plain_field :identifier
    plain_field :transaction_reference_number

    plain_field :financier_bank_account_tag
    plain_field :other_party_bank_account_tag # Not sure this is relevant.... It was here for legacy reasons, but I believe it's unused.

    plain_field :bank_country
    plain_field :bank_name # We can get this from the BSB in Au, but not sure of the source in NZ or other countries, so we might as well send it
    plain_field :bank_branch
    plain_field :bank_account_full_number # For Au accounts, the first 6 digits represent the bsb (bank,state,branch). For NZ, the first 6 represent bank and branch
    plain_field :bank_account_name # This may be possibly better called the bank account holder name...

    dollar_field :amount # This represents the amount requested. It's assumed that if the banking fails, it's all or nothing that fails. That's certainly true with the Au and NZ banks, but if other banks can process partial direct debits, then we'd need to split the concept of amount requested from amount processed and/or amount failed.

    plain_field :error_code
    plain_field :error_description
    plain_field :request_file_name
    plain_field :additional_reference
    plain_field :remitter_name

    object_field :bpay, FmDtos::BpayV1

    plain_field :particulars
    plain_field :analysis_code
    boolean_field :specified_payment
  end
end
