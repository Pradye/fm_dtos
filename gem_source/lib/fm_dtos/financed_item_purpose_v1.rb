module FmDtos
  class FinancedItemPurposeV1
    include FmDtos::FmEntityDtoV1
    def self.dto_version; 1 end

    integer_field       :position
    plain_field         :description
    plain_field         :payee_name
    plain_array_field   :disbursement_target_codes
    boolean_field       :refinance
    boolean_field       :active
  end
end

