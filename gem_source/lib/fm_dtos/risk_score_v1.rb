module FmDtos
  class RiskScoreV1
    include FmDtos::FmEntityDtoV1
    def self.dto_version; 1 end

    plain_field   :provider
    plain_field   :name
    plain_field   :code
    integer_field :score
  end
end
