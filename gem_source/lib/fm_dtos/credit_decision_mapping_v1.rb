module FmDtos
  class CreditDecisionMappingV1
    include FmDtos::FmEntityDtoV1
    def self.dto_version; 1 end

    plain_field :entity_key
    plain_field :decision
    plain_field :credit_application_status
    plain_field :origination_application_status
    boolean_field :active
  end
end
