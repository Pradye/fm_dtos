module FmDtos
  class BankAccountV1
    include FmDtos::FmEntityDtoV1
    def self.dto_version; 1 end

    plain_field :bsb
    plain_field :number
    plain_field :name
    plain_field :institution_name
    plain_field :branch_location
    plain_field :region
  end
end
