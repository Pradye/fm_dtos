module FmDtos
  class CustomerExpenseV1
    include FmDtos::FmEntityDtoV1
    def self.dto_version; 1 end

    integer_field :position # aka number aka index

    plain_field :type # eg general_living_expense
    plain_field :sub_type # eg housing
    plain_field :sub_sub_type # eg repairs
    plain_field :category # eg housing
    plain_field :subcategory # eg repairs
    plain_field :additional_description
    plain_field :associated_party_roles
    object_array_field :associated_customers, FmDtos::GenericReferenceV1

    dollar_field :periodic_amount
    dollar_field :revised_monthly_payment
    dollar_field :calculated_monthly_payment
    dollar_field :declared_monthly_payment
    plain_field :frequency # weekly, fortnightly, monthly, quarterly, half_yearly, yearly
    boolean_field :is_split

    boolean_field :shared # if expense is shared, eg. with partner
    plain_field :shared_with
    dollar_field :monthly_shared_amount
  end
end
