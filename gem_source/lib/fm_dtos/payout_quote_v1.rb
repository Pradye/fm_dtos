module FmDtos
  # Payout quote version 1
  class PayoutQuoteV1
    include FmDtos::FmEntityDtoV1
    def self.dto_version
      1
    end

    plain_field :requestor_title
    plain_field :requestor_first_name
    plain_field :requestor_last_name
    plain_field :requestor_address_line_one
    plain_field :requestor_address_line_two

    plain_field :contract_number
    plain_field :contract_name

    plain_field :vehicle_description
    plain_field :vehicle_vin
    plain_field :vehicle_description_without_rego

    plain_field :finance_product

    boolean_field :preferential_payout

    dollar_field :payout_amount
    dollar_field :preferential_payout_amount

    date_field :valid_upto_date
    date_field :quote_issued_date
    plain_field :bpay_reference_number

    object_field :franchise, FmDtos::FranchiseV3
  end
end
