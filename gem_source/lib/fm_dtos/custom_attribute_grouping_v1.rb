module FmDtos
  class CustomAttributeGroupingV1
    include FmDtos::FmEntityDtoV1
    def self.dto_version; 1 end


    object_field  :custom_attribute, FmDtos::GenericReferenceV1
    object_field  :custom_attribute_group, FmDtos::CustomAttributeGroupV1
    integer_field :position
  end
end
