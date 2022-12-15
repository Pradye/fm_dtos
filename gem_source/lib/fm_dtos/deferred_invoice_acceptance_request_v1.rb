module FmDtos
  class DeferredInvoiceAcceptanceRequestV1
    include FmDtos::FmEntityDtoV1
    def self.dto_version; 1 end

    object_field :wholesale_vehicle_ref, FmDtos::GenericReferenceV1

  end
end
