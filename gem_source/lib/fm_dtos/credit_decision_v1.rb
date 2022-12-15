module FmDtos
  class CreditDecisionV1
    include FmDtos::FmEntityDtoV1
    def self.dto_version; 1 end

    plain_field :decision_code
    plain_field :decision_description
    plain_field :decided_by_username
    plain_field :decided_by_user_display_name

    plain_field :application_number
    integer_field :credit_submission_version

    integer_field :term_min
    integer_field :term_max
    decimal_field :lvr_min
    decimal_field :lvr_max
    decimal_field :naf_min
    decimal_field :naf_max
    plain_field :security_type

    boolean_field :is_approved
    boolean_field :is_withdrawn
    boolean_field :is_declined
    boolean_field :is_request_for_changes

    boolean_field :is_latest_decision_for_application_version
    boolean_field :is_latest_decision_for_application
    boolean_field :is_first_approval_decision_for_application

    boolean_field :is_automated_decision
    boolean_field :is_additional_documentation_requested

    object_field :accompanying_note, FmDtos::ContractNoteV1
  end
end
