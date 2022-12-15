module FmDtos
  class RestructureRequestV1
    include FmDtos::FmEntityDtoV1
    def self.dto_version; 1 end

    plain_field     :payment_sets
  end
end

