module FmDtos
  class GenericIndexV1
    include ::HashableDto
    def self.dto_version; 1 end
    plain_field :event_entity_key
    timestamp_field :event_timestamp
    plain_field :url
  end
end
