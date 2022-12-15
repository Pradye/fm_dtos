module FmDtos
  class WholesaleDealershipRelatedFacilityV1
    include FmDtos::FmEntityDtoV1
    def self.dto_version; 1 end

    plain_field :owner_class
    object_field :owner_ref, FmDtos::GenericReferenceV1

    dollar_field :accrued_interest
    dollar_field :aggregate_accrued_interest
    dollar_field :payout_amount
    dollar_field :aggregate_payout_amount
    dollar_field :interest_balance
    dollar_field :interest_gst_balance
    dollar_field :capital_account_balance
    dollar_field :gst_account_balance
    dollar_field :outstanding_due_payment_amount
    dollar_field :aggregate_capital_balance
    dollar_field :capital_balance
  end
end
