module FmDtos
  class DebtAssignmentV1
    include FmDtos::FmEntityDtoV1

    datetime_field :assigned_at
    decimal_field :unit_price
    decimal_field :sold_amount

    object_field :retail_contract, FmDtos::RetailContractV1
    object_field :collections_partner, FmDtos::BusinessPartnerV1
  end
end
