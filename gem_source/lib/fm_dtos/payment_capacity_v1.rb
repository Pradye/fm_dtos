module FmDtos
  class PaymentCapacityV1
    include FmDtos::FmEntityDtoV1
    def self.dto_version; 1 end

    decimal_field :amount
    object_array_field :payment_capacity_variables, FmDtos::PaymentCapacityVariableV1
  end
end
