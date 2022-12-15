module FmDtos
  class WholesaleCreditLineV1
    include FmDtos::FmEntityDtoV1
    def self.dto_version; 1 end

    class RepaymentV1
      include FmDtos::FmEntityDtoV1
      def self.dto_version; 1 end

      plain_field :position
      dollar_field :amount
      boolean_field :charged
      datetime_field :due_at
    end


    object_field :wholesale_dealership_ref, FmDtos::GenericReferenceV1
    object_array_field :repayments, FmDtos::WholesaleCreditLineV1::RepaymentV1

    plain_field :purpose
    plain_field :repayment_type
    dollar_field :credit_limit
    dollar_field :current_drawdown_amount
    dollar_field :available_credit_excl_pending
    decimal_field :current_interest_rate
    boolean_field :redraw_available
    boolean_field :repayments_activated
    dollar_field :current_maximum_exposure
    dollar_field :maximum_redraw_amount
    date_field :repayments_start_date
    date_field :repayments_end_date
  end
end
