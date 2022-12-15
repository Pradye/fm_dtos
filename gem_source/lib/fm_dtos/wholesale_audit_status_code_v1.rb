module FmDtos
  class WholesaleAuditStatusCodeV1
    include FmDtos::FmEntityDtoV1
    def self.dto_version; 1 end

    plain_field :code
    plain_field :description
    plain_field :details
  end
end
