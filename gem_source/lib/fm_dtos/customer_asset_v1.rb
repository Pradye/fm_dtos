module FmDtos
  class CustomerAssetV1
    include FmDtos::FmEntityDtoV1
    def self.dto_version; 1 end

    integer_field :position # aka number aka index

    plain_field :type # eg real_estate
    plain_field :additional_description
    object_array_field :associated_customers, FmDtos::GenericReferenceV1

    object_field :asset_location, FmDtos::AddressV1
    dollar_field :declared_value
  end
end

