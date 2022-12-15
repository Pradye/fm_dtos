module FmDtos
  class UserV4
    include FmDtos::FmEntityDtoV1
    def self.dto_version; 4 end

    plain_field :username
    plain_field :permissions
    plain_field :special_attributes
    timestamp_field :lock_event_timestamp

    plain_field :full_name
    plain_field :phone
    plain_field :mobile
    plain_field :email
    plain_field :job_title

    plain_field :active_session

    boolean_field :applicability_dependent_on_included_franchises
    object_array_field :included_franchises_refs, FmDtos::GenericReferenceV1
    object_array_field :application_category_rule_refs, FmDtos::GenericReferenceV1
  end
end

