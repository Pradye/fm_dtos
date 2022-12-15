module FmDtos
  class PaymentCapacityVariableV1
    include FmDtos::FmEntityDtoV1
    def self.dto_version; 1 end

    plain_field :name
    plain_field :value
    boolean_field :read_only
  end
end
