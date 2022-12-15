# frozen_string_literal: true

module FmDtos
  class WholesaleFinancialEventV1
    include FmDtos::FmEntityDtoV1
    def self.dto_version; 1 end

    decimal_field   :gst_amount
    decimal_field   :net_amount
    plain_field     :description
    datetime_field  :effective_date
    object_field    :wholesale_loan_ref, FmDtos::GenericReferenceV1
  end
end
