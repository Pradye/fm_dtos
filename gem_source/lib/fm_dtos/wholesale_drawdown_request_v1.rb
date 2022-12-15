module FmDtos
  class WholesaleDrawdownRequestV1
    include FmDtos::FmEntityDtoV1
    def self.dto_version; 1 end

    plain_field  :facility_type
    object_field :facility_ref, FmDtos::GenericReferenceV1

    dollar_field  :amount
    boolean_field :suppress_disbursement
    plain_field   :note
  end
end
