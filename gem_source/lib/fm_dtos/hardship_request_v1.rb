module FmDtos
  class HardshipRequestV1
    include FmDtos::FmEntityDtoV1

    datetime_field :start_date
    datetime_field :end_date
    datetime_field :first_communication_date
    datetime_field :reply_date
    datetime_field :complete_date

    plain_array_field    :decline_reasons
    plain_array_field    :document_types
    plain_array_field    :labels

    object_field         :customer, FmDtos::CustomerV1
    object_array_field   :associated_customers, FmDtos::CustomerV1
    object_array_field   :contracts, FmDtos::RetailContractV1

  end
end