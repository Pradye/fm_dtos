module FmDtos
  class HardshipRestructureRequestV1
    include FmDtos::FmEntityDtoV1
    def self.dto_version; 1 end

    object_field         :hardship_request, FmDtos::HardshipRequestV1
    object_field         :restructure_request, FmDtos::RestructureRequestV1
    object_field         :first_hardship_repayment, FmDtos::RepaymentV1
    object_field         :last_hardship_repayment, FmDtos::RepaymentV1
    object_field         :before_hardship_repayment, FmDtos::RepaymentV1
    object_field         :after_hardship_repayment, FmDtos::RepaymentV1
  end
end

