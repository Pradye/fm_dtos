module FmDtos
  class DuePaymentV1
    include FmDtos::FmEntityDtoV1
    def self.dto_version; 1 end

    decimal_field   :gross_amount
    decimal_field   :unpaid_amount
    boolean_field   :is_active
    plain_field     :description
    datetime_field  :date_incurred
    datetime_field  :date_due
    datetime_field  :grace_period_expiry_date
    plain_field     :source_type
    datetime_field  :date_fully_paid

    object_field :facility_ref, FmDtos::GenericReferenceV1
    object_field :direct_debit_ref, FmDtos::GenericReferenceV1
    object_array_field :scheduled_direct_debits, FmDtos::ScheduledDirectDebitV1
  end
end
