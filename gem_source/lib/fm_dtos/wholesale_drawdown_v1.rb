module FmDtos
  class WholesaleDrawdownV1
    include FmDtos::FmEntityDtoV1
    def self.dto_version; 1 end

    object_field :facility_ref, FmDtos::GenericReferenceV1

    dollar_field  :amount
    plain_field :status_code
    datetime_field :effective_at

    boolean_field :suppress_disbursement
    plain_field   :note
  end
end
