module FmDtos
  class WholesaleAdjustmentV1
    include FmDtos::FmEntityDtoV1
    def self.dto_version; 1 end

    object_field :facility_ref, FmDtos::GenericReferenceV1
    plain_field :status_code
    dollar_field :gst_amount, :net_amount

    datetime_field :due_date, :effective_date
    plain_field :transaction_type
  end
end
