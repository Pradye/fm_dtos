module FmDtos
  class ScheduledDirectDebitV1
    include FmDtos::FmEntityDtoV1
    def self.dto_version; 1 end

    date_field :start_reference_date # Could be null, meaning not determined
    plain_field :frequency # weekly, fortnightly, monthly, etc - would _not_ include accelerated frequencies, which incorporate monthly repayments due and weekly or fortnightly direct debits scheduled
    integer_field :periods_before_start
    integer_field :number # or count
    plain_field :status_code # proposed (for applications), scheduled (post settlement), collected
    dollar_field :gross_amount

    date_field     :scheduled_date
    datetime_field :banking_request_creation_timestamp
    decimal_field  :amount_ex_debit_fee
    decimal_field  :debit_fee_amount
    decimal_field  :total_amount
    decimal_field  :total_banking_request_amount
    plain_field    :direct_debit_type
    plain_field    :notes
    datetime_field :raised_timestamp
    boolean_field  :manual

    object_field :business_partner_ref, FmDtos::GenericReferenceV1
  end
end
