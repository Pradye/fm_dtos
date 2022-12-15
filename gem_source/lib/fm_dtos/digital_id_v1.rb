module FmDtos
  class DigitalIdV1
    include FmDtos::FmEntityDtoV1
    def self.dto_version; 1 end

    plain_field :service
    plain_field :status
    datetime_field :completed_at
    integer_field :attempts_remaining

    plain_field :liveness_passed
    plain_field :dvs_passed
    plain_field :face_matched
    plain_field :details_matched

    object_field :customer_ref, FmDtos::GenericReferenceV1
  end
end
