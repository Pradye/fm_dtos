module FmDtos
  class WholesaleOffsetV1
    include FmDtos::FmEntityDtoV1
    def self.dto_version; 1 end

    object_field :wholesale_dealership_ref, FmDtos::GenericReferenceV1

    decimal_field :margin
    plain_field :active
    dollar_field :balance
    dollar_field :accrued_interest_amount
  end
end
