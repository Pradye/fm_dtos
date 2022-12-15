module FmDtos
  class BpayV1
    include FmDtos::FmEntityDtoV1

    def self.dto_version; 1 end

    plain_field :biller_code
    plain_field :biller_reference
    plain_field :biller_short_name
    plain_field :biller_name
  end
end
