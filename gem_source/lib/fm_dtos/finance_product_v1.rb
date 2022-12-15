module FmDtos
  class FinanceProductV1
    include FmDtos::FmEntityDtoV1
    def self.dto_version; 1 end

    plain_field :name
    plain_field :code # eg consumer_loan, secured_loan
  end
end

