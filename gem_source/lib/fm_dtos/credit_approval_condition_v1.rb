module FmDtos
  class CreditApprovalConditionV1
    include FmDtos::FmEntityDtoV1
    def self.dto_version
       1
    end

    integer_field :position

    plain_field :type
    plain_field :description
  end
end
