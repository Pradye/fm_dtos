module FmDtos
  class CustomerIncomeV1
    include FmDtos::FmEntityDtoV1
    def self.dto_version; 1 end

    integer_field :position # aka number aka index

    plain_field :type # eg payg, other, investment_rental
    plain_field :additional_description
    plain_field :associated_party_roles
    object_array_field :associated_customers, FmDtos::GenericReferenceV1

    boolean_field :primary
    dollar_field :periodic_amount
    dollar_field :gross_periodic_amount
    dollar_field :revised_monthly_income
    dollar_field :calculated_monthly_income
    dollar_field :declared_monthly_income
    plain_field :frequency # weekly, fortnightly, monthly, quarterly, half_yearly, yearly

    object_field :represents_rent_from_customer_asset_ref, FmDtos::GenericReferenceV1
  end
end
