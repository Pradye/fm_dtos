module FmDtos
  class WholesaleReleaseRequestV1
    include FmDtos::FmEntityDtoV1
    def self.dto_version; 1 end

    object_field :floorplan_ref, FmDtos::GenericReferenceV1

    plain_field :dealership_number
    plain_field :plan_type

    dollar_field :amount
    plain_field :purpose
    plain_field :status_code
    plain_field :release_number
  end
end
