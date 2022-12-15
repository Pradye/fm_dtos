module FmDtos
  class WholesaleDealershipV1
    include FmDtos::FmEntityDtoV1
    def self.dto_version; 1 end

    object_field :dealership_ref, FmDtos::DealershipReferenceV1
  end
end
