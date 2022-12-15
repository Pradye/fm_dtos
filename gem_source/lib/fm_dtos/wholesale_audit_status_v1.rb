module FmDtos
  class WholesaleAuditStatusV1
    include FmDtos::FmEntityDtoV1
    def self.dto_version; 1 end

    plain_field :status_code
  end
end
