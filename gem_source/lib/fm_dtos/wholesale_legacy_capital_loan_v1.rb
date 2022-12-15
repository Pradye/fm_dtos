module FmDtos
  class WholesaleLegacyCapitalLoanV1
    include FmDtos::FmEntityDtoV1
    def self.dto_version; 1 end

    object_field :wholesale_dealership_ref, FmDtos::GenericReferenceV1

    plain_field :purpose
    dollar_field :loan_amount
    decimal_field :rate
    integer_field :term
    dollar_field :repayment_amount
    dollar_field :payout_amount
    dollar_field :accrued_interest_amount
  end
end
