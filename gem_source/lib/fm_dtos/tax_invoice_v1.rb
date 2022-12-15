# frozen_string_literal: true

module FmDtos
  class TaxInvoiceV1
    include FmDtos::FmEntityDtoV1
    def self.dto_version; 1 end

    date_field  :generation_date
    plain_field :file_url

    plain_field  :status_code
    plain_field  :year_month
    dollar_field :total_commission
    dollar_field :total_clawback
    plain_field  :name
    date_field   :payment_date
    date_field   :last_banking_acknowledgement_date

    object_field :partner, FmDtos::BusinessPartnerV1
  end
end
