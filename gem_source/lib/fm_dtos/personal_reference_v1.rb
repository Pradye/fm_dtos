module FmDtos
  class PersonalReferenceV1
    include FmDtos::FmEntityDtoV1
    def self.dto_version; 1 end

    integer_field :position # aka number aka index

    object_array_field :for_customers, FmDtos::GenericReferenceV1

    plain_field :relationship_description

    plain_field :first_name
    plain_field :middle_name
    plain_field :last_name

    plain_field :primary_phone_number
    object_field :address, FmDtos::AddressV1
  end
end
