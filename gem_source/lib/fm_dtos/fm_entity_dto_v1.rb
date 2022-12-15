module FmDtos
  module FmEntityDtoV1
    extend ActiveSupport::Concern
    included do
      include ::HashableDto
      plain_field :entity_key
      plain_field :source, :source_key
      timestamp_field :creation_event_timestamp
      timestamp_field :update_event_timestamp
      timestamp_field :decision_event_timestamp
      timestamp_field :submission_event_timestamp
      timestamp_field :deletion_event_timestamp
    end
  end
end
