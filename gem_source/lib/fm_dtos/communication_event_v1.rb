module FmDtos
  class CommunicationEventV1
    include FmDtos::FmEntityDtoV1
    def self.dto_version; 1 end

    plain_field          :event_type_code
    plain_array_field    :event_tag_codes
    plain_field          :message
    object_field         :franchise_ref, FmDtos::GenericReferenceV1
    object_array_field   :recipients, FmDtos::CommunicationRecipientV1
    object_array_field   :files, FmDtos::FileV1

    json_field :data
  end
end
