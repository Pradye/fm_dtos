module FmDtos
  class WholesaleDealershipFloorplanV1
    include FmDtos::FmEntityDtoV1
    def self.dto_version; 1 end

    object_field :wholesale_dealership_ref, FmDtos::GenericReferenceV1

    plain_field :plan_type
    dollar_field :credit_limit
    dollar_field :current_drawdown_balance
    dollar_field :available_credit_excl_pending
    decimal_field :current_interest_rate
    boolean_field :is_free_floorplan
  end
end
