module FmDtos
  class ContractPaymentV1
    include FmDtos::FmEntityDtoV1
    def self.dto_version; 1 end

    decimal_field  :amount
    plain_field    :source_type
    datetime_field :effective_date
  end
end
