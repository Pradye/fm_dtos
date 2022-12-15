module FmDtos
  class DealershipReferenceV1
    include FmDtos::FmEntityDtoV1
    def self.dto_version; 1 end

    plain_field :dealership_number, :name
  end
end
