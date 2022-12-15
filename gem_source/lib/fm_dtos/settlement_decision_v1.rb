module FmDtos
  class SettlementDecisionV1
    include FmDtos::FmEntityDtoV1
    def self.dto_version; 1 end

    plain_field :decision_code
    plain_field :decision_description
    plain_field :decided_by_username

    plain_field :application_number
    plain_field :applicant_names
    integer_field :settlement_version
  end
end
