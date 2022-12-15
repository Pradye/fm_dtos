module FmDtos
  class BankBranchRegisterV1
    include FmDtos::FmEntityDtoV1
    def self.dto_version; 1 end

    plain_field :bank_name
    plain_field :bank_number
    plain_field :branch_number
    integer_field :region
  end
end
