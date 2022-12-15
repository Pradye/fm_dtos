module FmDtos
  class FinancierV1
    include FmDtos::FmEntityDtoV1
    def self.dto_version; 1 end

    plain_field :name
    
    plain_field :code
    plain_field :source
    plain_field :source_key
    plain_field :registered_name
    plain_field :phone
    plain_field :mobile
    plain_field :fax
    plain_field :email
    plain_field :abn
    plain_field :acn
    plain_field :cost_centre_code
    plain_field :mailing_address_line_one
    plain_field :mailing_address_line_two
    plain_field :mailing_postcode
    plain_field :mailing_locality
    plain_field :mailing_state_code
  end
end
