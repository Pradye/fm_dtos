module FmDtos
  class ContractTagV1
    include FmDtos::FmEntityDtoV1
    def self.dto_version; 1 end

    object_field :finance_agreement_ref, FmDtos::GenericReferenceV1

    object_field :tags, FmDtos::GenericReferenceV1

    object_field :note_created_on_addition_of_tag_ref, FmDtos::GenericReferenceV1
    object_field :note_created_on_removal_of_tag_ref, FmDtos::GenericReferenceV1
  end
end
