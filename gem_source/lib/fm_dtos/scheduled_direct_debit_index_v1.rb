module FmDtos
  class ScheduledDirectDebitIndexV1 < FmDtos::GenericIndexV1
    plain_field   :status_code
    decimal_field :total_amount
  end
end
