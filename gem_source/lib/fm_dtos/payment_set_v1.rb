module FmDtos
  class PaymentSetV1
    include FmDtos::FmEntityDtoV1
    def self.dto_version; 1 end

    date_field :start_reference_date # This could be null, meaning currently not determined
    plain_field :frequency # weekly, fortnightly, monthly, etc - would _not_ include accelerated frequencies, which incorporate monthly repayments due and weekly or fortnightly direct debits scheduled
    integer_field :periods_before_start # These are not guaranteed to be unique. It is possible to have the final repayment and the balloon payment due on the same day, and each would be in its own payment set.

    integer_field :number # or count

    plain_field :status_code # proposed (for applications), scheduled (post settlement), charged, paid, forgiven (charged, but subequently forgiven and no longer due). Since this relates to the whole payment set, if different payments have different statuses, they must be split into different payment sets

    dollar_field :principal_and_interest_amount
    dollar_field :principal_and_interest_gst_amount # Note that this model does not work well for the older Australian Hire Purchase tax treatment, where the gst was charged only on the interest component of an installment. The tax treatment has since changed, so this is fine for now
    dollar_field :account_keeping_fee_amount
    dollar_field :account_keeping_fee_gst_amount
    dollar_field :stamp_duty # used for hiring duty

    boolean_field :gross_amount_specified_by_user # If this is false, then the amount have been calculated by the system
    boolean_field :balloon_or_lump_sum_amount # Used for balloon amounts, or other repayments where we would expect the total amount to be taken in one lump sum
  end
end
