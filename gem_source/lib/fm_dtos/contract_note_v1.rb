module FmDtos
  class ContractNoteV1
    include FmDtos::FmEntityDtoV1
    def self.dto_version; 1 end

    object_field :finance_agreement_ref, FmDtos::GenericReferenceV1

    plain_field :application_number
    plain_field :contract_number
    integer_field :credit_submission_version # aka application version (incremented when something changes that may affect a credit decision that's already been made)
    integer_field :contract_data_version # aka settlement submission version (incremented when data that affects a finance contract document changes)

    object_array_field :referenced_parties, FmDtos::GenericReferenceV1

    plain_field :created_in_system_name
    plain_field :created_by_username

    plain_field :content # This would most likely be a "text" / clob field

    datetime_field :to_be_followed_up_by

    timestamp_field :followed_up_at
    plain_field :followed_up_by_username

    boolean_field :share_with_originator
    plain_field :acknowledged_by_originator_username
    timestamp_field :acknowledged_by_originator_at

    boolean_field :share_with_credit
    plain_field :acknowledged_by_credit_username
    timestamp_field :acknowledged_by_credit_at

    boolean_field :share_with_settlements
    plain_field :acknowledged_by_settlements_username
    timestamp_field :acknowledged_by_settlements_at

    boolean_field :share_with_contract_management
    plain_field :acknowledged_by_contract_management_username
    timestamp_field :acknowledged_by_contract_management_at

    boolean_field :share_with_commissions
    plain_field :acknowledged_by_commissions_username
    timestamp_field :acknowledged_by_commissions_at

    boolean_field :share_with_collections
    plain_field :acknowledged_by_collections_username
    timestamp_field :acknowledged_by_collections_at

    boolean_field :relates_to_customer_communication # The actual customers referenced are described in the referenced_parties, or as other_party
    boolean_field :relates_to_originator_communication
    plain_field :description_of_other_party_for_communication
    plain_field :communication_method

    boolean_field :contains_credit_decline_reasons
    boolean_field :contains_settlement_conditions
    boolean_field :contains_settlement_rejection_reasons

    boolean_field :keep_on_top
    plain_field :additional_attributes
  end
end
