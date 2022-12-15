module FmDtos
  class ReviewRequestV1
    include FmDtos::FmEntityDtoV1
    def self.dto_version; 1 end

    plain_field :review_type
    plain_field :status_code
    timestamp_field :reviewed_at

    plain_field :response_code
    plain_field :response_message

    plain_field :application_number
    plain_field :applicant_names

    object_field :finance_agreement, FmDtos::FinanceAgreementV1
  end
end
