module FmDtos
  class CustomerLiabilityV1
    include FmDtos::FmEntityDtoV1
    def self.dto_version
      1
    end

    integer_field :position # aka number aka index

    plain_field :type # eg credit_card, vehicle_loan, vehicle_lease
    plain_field :additional_description
    plain_field :associated_party_roles
    object_array_field :associated_customers, FmDtos::GenericReferenceV1

    plain_field :financier_name

    dollar_field :credit_limit
    dollar_field :original_loan_amount
    dollar_field :current_balance

    boolean_field :fixed_rate
    boolean_field :is_company_liability
    decimal_field :current_interest_rate

    integer_field :term_remaining_in_months

    dollar_field :repayment_periodic_amount # This is usually disregarded for credit card liabilities, and may be recalculated for variable rate mortgages to determine sensitivity to variation
    plain_field :repayment_frequency

    boolean_field :to_be_paid_out_at_settlement # I believe that these fields really relate to the payout of a trade-in vehicle, so the details should already have been captured. It's possible though, that the vehicle which is being traded in, has trade-in equity of zero (ie the payout + refund is equal to the value of the trade-in), so the originator does not bother to enter the details into the finance application, in which case they can be entered here in order to indicate that this loan will be discharged when the new vehicle is sold and the trade-in purchased by the dealer.
    plain_field :registration_number_for_payout # I'd really like to get rid of this field and the field "to_be_paid_out_at_settlement", and replace with the reference to the trade-in, below, which would only be available when the trade-in has a payout amount indicated. The next field, the contract number, would need to be captured somewhere, but it make more sense to me to move that to the trade-in entity
    plain_field :contract_number_for_payout
    boolean_field :to_be_paid_out_rv

    dollar_field :revised_monthly_payment
    dollar_field :calculated_monthly_payment
    dollar_field :declared_monthly_payment

    object_field :represents_finance_for_traded_in_asset_ref,
                 FmDtos::GenericReferenceV1
    object_field :represents_mortgage_for_customer_asset_ref,
                 FmDtos::GenericReferenceV1

    boolean_field :shared # if liability is shared, eg. with partner
    plain_field :shared_with
    dollar_field :monthly_shared_amount
  end
end
