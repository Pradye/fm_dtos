module FmDtos
  class ServiceContractV1
    include FmDtos::FmEntityDtoV1
    def self.dto_version
      1
    end

    integer_field :position

    plain_field :supplier_name
    plain_field :reference_number
    dollar_field :amount
  end
end
