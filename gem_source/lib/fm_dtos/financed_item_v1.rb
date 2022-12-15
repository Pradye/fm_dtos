module FmDtos
  class FinancedItemV1
    include FmDtos::FmEntityDtoV1
    def self.dto_version; 1 end

    integer_field :position # aka number aka index

    plain_field :purpose # eg vehicle_purchase
    plain_field :additional_description

    boolean_field :for_collateral
    object_field :collateral_ref, FmDtos::GenericReferenceV1

    boolean_field :supplied_by_customer
    boolean_field :supplied_by_originator
    boolean_field :supplied_by_other_business_partner
    boolean_field :supplied_by_external_named_supplier
    object_field :supplier_business_partner_ref, FmDtos::GenericReferenceV1

    plain_field :external_supplier_name

    object_field :external_supplier_bank_account, FmDtos::BankAccountV1
    object_field :external_supplier_bpay, FmDtos::BpayV1

    dollar_field :base_price_including_options_accessories_and_taxes
    dollar_field :total_on_road_costs

    dollar_field :delivery_component_of_on_road_costs
    dollar_field :registration_and_stamp_duty_component_of_on_road_costs
    dollar_field :third_party_insurance_component_of_on_road_costs

    dollar_field :options_component_of_base_price
    dollar_field :accessories_component_of_base_price
    dollar_field :luxury_car_tax_component_of_base_price
    dollar_field :goods_and_services_tax_component_of_base_price
    dollar_field :input_tax_credit_amount_available

    boolean_field :luxury_car_tax_applied
    boolean_field :goods_and_services_tax_applied
    boolean_field :input_tax_credit_applied # I prefer the name "input tax credit claimed" here to be more about the business than about the calculation, but technically it may not yet have been claimed when this is sent, so all we know is that we've applied the benefit to the amount financed.
  end
end

