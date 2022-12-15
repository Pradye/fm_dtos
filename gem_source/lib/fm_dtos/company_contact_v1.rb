# frozen_string_literal: true

module FmDtos
  class CompanyContactV1
    include FmDtos::FmEntityDtoV1
    def self.dto_version; 1 end

    plain_field :first_name
    plain_field :middle_name
    plain_field :last_name
    plain_field :phone_number
    plain_field :mobile_phone_number

    plain_field :email
    plain_field :role
    date_field :date_of_birth
  end
end
