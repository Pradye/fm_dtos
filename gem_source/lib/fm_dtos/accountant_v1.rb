# frozen_string_literal: true

module FmDtos
  class AccountantV1
    include FmDtos::FmEntityDtoV1
    def self.dto_version; 1 end

    plain_field :first_name
    plain_field :middle_name
    plain_field :last_name
    plain_field :phone_number
    plain_field :company_name

    object_field :address, FmDtos::AddressV1
  end
end
