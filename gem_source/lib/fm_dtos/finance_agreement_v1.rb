module FmDtos
  class FinanceAgreementV1
    include FmDtos::FmEntityDtoV1
    def self.dto_version
      1
    end

    object_field :originating_business_partner_ref, FmDtos::GenericReferenceV1
    object_field :originating_business_partner, FmDtos::BusinessPartnerV1, default_to_empty: true
    plain_field :supplier_name

    # The following fields are deprecated
    plain_field_deprecated :originating_business_partner_name, :name, ->(o) { o.originating_business_partner }
    plain_field_deprecated :originating_business_partner_state_key, :state_or_region, ->(o) { o.originating_business_partner.address }
    plain_field_deprecated :originating_business_partner_phone_number, :phone, ->(o) { o.originating_business_partner }
    plain_field_deprecated :originating_business_partner_acn, :acn, ->(o) { o.originating_business_partner }
    plain_field_deprecated :originating_business_partner_address_line_one, :formatted_line_1_of_3, ->(o) { o.originating_business_partner.address }
    plain_field_deprecated :originating_business_partner_address_line_two, :formatted_line_2_of_3, ->(o) { o.originating_business_partner.address }
    plain_field_deprecated :originating_business_partner_code, :dealership_number, ->(o) { o.originating_business_partner }
    # End of deprecated fields

    object_field :branding_franchise_ref, FmDtos::GenericReferenceV1

    object_field :finance_product_ref, FmDtos::GenericReferenceV1
    plain_field :finance_product_internal_code
    plain_field :finance_product_name
    boolean_field :guaranteed_buyback # for agility
    boolean_field :product_finance_lease
    boolean_field :product_operating_lease
    boolean_field :product_consumer_loan
    boolean_field :product_commercial_loan
    boolean_field :product_asset_hire_purchase

    object_field :finance_type_ref, FmDtos::GenericReferenceV1 # The "type" is loan, lease or hire-purchase, as opposed to the product
    plain_field :finance_type_internal_code
    plain_field :finance_type_name

    object_array_field :finance_sub_product_refs, FmDtos::GenericReferenceV1
    object_field :finance_campaign_ref, FmDtos::GenericReferenceV1
    plain_field :finance_campaign_code
    plain_field :finance_campaign_name
    dollar_field :finance_campaign_commission_amount
    decimal_field :finance_campaign_commission_percentage

    plain_field :application_number
    plain_field :contract_number
    integer_field :credit_submission_version # aka application version (incremented when something changes that may affect a credit decision that's already been made)
    integer_field :contract_data_version # aka settlement submission version (incremented when data that affects a finance contract document changes)

    timestamp_field :origination_creation_timestamp
    timestamp_field :contract_generation_timestamp

    timestamp_field :origination_quote_expiry_timestamp
    plain_field :quote_agility

    timestamp_field :first_credit_submission_timestamp
    timestamp_field :latest_credit_submission_timestamp
    timestamp_field :first_documentation_submission_timestamp
    timestamp_field :latest_documentation_submission_timestamp
    timestamp_field :first_settlement_submission_timestamp
    timestamp_field :latest_settlement_submission_timestamp

    object_field :last_credit_decision, FmDtos::CreditDecisionV1
    timestamp_field :first_credit_decision_timestamp
    timestamp_field :latest_credit_decision_timestamp

    timestamp_field :latest_credit_decision_expiry_timestamp # Usually 30 days after the latest credit decision....

    timestamp_field :first_documentation_decision_timestamp
    timestamp_field :latest_documentation_decision_timestamp
    timestamp_field :first_settlement_decision_timestamp
    timestamp_field :latest_settlement_decision_timestamp

    boolean_field :approved_for_credit    # These flags track the progress of the agreement through its application and contract stages. They do not deal with the minutiae, and do not track failures along this path. We can add more flags to this list, but please don't model the workflow at too fine-grained of a level here. It is anticipated that by the end of a contract's life, all of these flags will be "true"

    boolean_field :documentation_verified # "
    boolean_field :settled                # "
    boolean_field :contract_activated     # "
    boolean_field :contract_closed        # "

    plain_field :status_code_in_publishing_system
    plain_field :global_status_code

    plain_field :applicant_names
    plain_field :application_name
    plain_field :borrowing_entity_name # For co-borrowers, this is the combined names

    plain_field :application_contact_person_full_name
    plain_field :application_contact_person_email_address
    plain_field :application_contact_person_phone_number

    plain_field :originating_person_full_name
    plain_field :originating_person_username
    plain_field :originating_person_email_address
    plain_field :originating_person_phone_number

    object_array_field :collateral_items, FmDtos::CollateralV1

    object_array_field :financed_items, FmDtos::FinancedItemV1
    object_array_field :trade_ins, FmDtos::TradedInAssetV1

    dollar_field :cash_deposit_amount
    dollar_field :cheque_deposit_amount
    dollar_field :electronic_deposit_amount

    dollar_field :establishment_fee_financed_amount
    dollar_field :establishment_fee_gst_amount
    dollar_field :establishment_fee_less_gst_amount
    dollar_field :establishment_fee_upfront_amount
    dollar_field :origination_fee_financed_amount
    dollar_field :origination_fee_upfront_amount
    dollar_field :origination_fee
    dollar_field :establishment_fee
    dollar_field :application_ppsr_fee_amount # We currently don't support a ppsr fee per secured asset (because none of our clients charge it that way), but if we did, those would be captured on the collateral, not here.
    dollar_field :vehicle_price_less_applicable_taxes

    object_array_field :insurances, FmDtos::InsuranceV1

    dollar_field :purchase_gst_amount_financed # If the finance product requires that the gst on the items being purchased is paid off by the installments, then this value represents the total of the "input_tax_credit_amount_available" values from the financed items, for those items where the input tax credit is also applied. The reason the input tax credit is technically more correct than the gst component of the base price is that we're actually reducing the amount financed by the input tax credit, not the gst, and then that same amount needs to be collected over the installments. In NZ (where this product and tax scheme are used), the input tax credit is not capped, so will always be the same as the gst. The flag currently controlling this on the finance product is called "installment_gst_distribution_of_asset_gst"
    dollar_field :interest_gst_amount_financed # If the finance product requires that the gst on the interest charges is financed (ie an Australian Hire Purchase agreement), then this will be the gst on the interest component of the repayments. The interest components of the repayments is also equal to the total of the P&I repayment amounts (including the balloon as a repayment) minus the total amount financed

    dollar_field :total_amount_financed # This should be calculated by the origination systems, but the total is also sent in order to exactly match the origination calculations. Really if this total does not match the components that are sent, we should be logging that as an error, but we try not to stop the business from proceeding.
    dollar_field :sub_total_gross_cost
    dollar_field :sub_total_less_gsthp
    dollar_field :gst_sub_total_hp
    dollar_field :vehicle_price_including_applicable_taxes
    dollar_field :terms_charges
    dollar_field :total_payments_and_interest
    dollar_field :deposit_plus_net_tradein_hp
    dollar_field :total_amount_payable_add_deposit_hp

    plain_field :first_payment_date
    dollar_field :first_pmt_duty
    dollar_field :first_pmt_gst
    dollar_field :first_pmt_amount
    dollar_field :pmt_net
    dollar_field :pmt_duty
    dollar_field :pmt_gst
    dollar_field :pmt_amount
    integer_field :num_payments_less_first_payment
    integer_field :total_num_payments
    dollar_field :total_pmt_net
    dollar_field :total_pmt_duty
    dollar_field :total_pmt_gst
    dollar_field :total_pmt_amount
    plain_field :vehicle_option_descriptions


    object_array_field :service_contracts, FmDtos::ServiceContractV1 # For service plan charge

    decimal_field :interest_rate # TODO(MP): Verify that this is OK as a single field, rather than a schedule
    decimal_field :base_interest_rate

    plain_field :billing_frequency # weekly, fortnightly, monthly, quarterly, half_yearly, yearly
    plain_field :direct_debit_frequency # weekly, fortnightly, monthly, quarterly, half_yearly, yearly

    dollar_field :weekly_equivalent_payment
    integer_field :term_in_months

    plain_field :account_keeping_fee_frequency # These account keeping fee fields are also apparent in the payment sets, though the periodic amount from which they were dervied may be obfuscated in there for various reasons
    dollar_field :account_keeping_fee_periodic_net_amount # The GST on the account keeping fee is only calculated when added to a payment set

    plain_field :payment_structure_code
    boolean_field :installments_made_in_advance
    boolean_field :use_structured_payments # This is a bit of an anachronism, since we now have a variety of payment structures...
    boolean_field :vary_first_rental # This is mutually exclusive of the structured payments flag

    boolean_field :balloon_specified_as_percentage_of_purchase_price
    dollar_field :balloon_amount # This would also be the sum of residual value amounts of the collateral assets, where the collateral has a residual. We don't support both a residual and a balloon, so if any asset has a residual value, this balloon amount must equal the sum of the asset residual values. If no asset has a residual value, then this balloon amount can be any amount, subject to the finance product constraints.
    decimal_field :balloon_percentage
    dollar_field :balloon_gst_amount # This would also be represented as the sum of the residual gst values of the collateral assets
    dollar_field :balloon_payment
    plain_field :est_annual_kms
    plain_field :new_used_demo
    plain_field :responsible_party_address
    plain_field :vehicle_short_description
    dollar_field :wear_and_tear_package
    dollar_field :car_care_package
    dollar_field :wall_box_package
    plain_field :sub_products_name
    dollar_field :vehicle_ins_cost
    dollar_field :cci_ins_cost
    dollar_field :gap_ins_cost
    dollar_field :vehicle_loan1_balance1
    dollar_field :vehicle_loan1_monthly_payment1
    plain_field :vehicle_loan2_to_be_paid_out_yes_flag1
    plain_field :vehicle_loan2_to_be_paid_out_no_flag1
    plain_field :vehicle_loan2_to_be_paid_out_rv_flag1
    plain_field :vehicle_loan2_to_be_paid_out_yes_flag2
    plain_field :vehicle_loan2_to_be_paid_out_no_flag2
    plain_field :vehicle_loan2_to_be_paid_out_rv_flag2



    object_array_field :payment_sets, FmDtos::PaymentSetV1
    boolean_field :scheduled_direct_debits_align_with_repayments
    object_array_field :scheduled_direct_debits, FmDtos::ScheduledDirectDebitV1 # Only required if scheduled_direct_debits_align_with_repayments is false

    boolean_field :refinance
    boolean_field :minimum_taxable_supply_certified

    plain_field :payment_method

    boolean_field :nominated_repayment_date_requested
    date_field :nominated_repayment_reference_date
    integer_field :nominated_repayment_day_of_week # 0=Sunday (same as ruby wday convention)
    integer_field :nominated_repayment_day_of_month # 1-31

    plain_field :comments # Though maybe this should be replaced by notes
    boolean_field :aware_of_financial_position_changes
    plain_field :financial_position_changes_description

    object_field :repayment_dd_bank_account, FmDtos::BankAccountV1
    object_field :upfront_amounts_dd_bank_account, FmDtos::BankAccountV1

    decimal_field :loan_value_ratio_percentage # This is the lvr expressed as a percentage, so 100.0 would represent that the adjusted loan amount (eg NAF - some insurances) is equal to the collateral value

    object_array_field :parties, FmDtos::RetailCustomerV1

    # I'd really like to model things like the ownership of a house with a mortgage and an investment income better (ie using the concept of a property, but that's over-modelling for what we need now. If the property were being rented, then we'd just capture the expense for the rent. Occupancies would then be modelled as the join between customers and a real estate property
    # object_array_field :customer_real_estate_properties, FmDtos::RealEstatePropertyV1
    # Mailing addresses, similar to real estate, can obviously be shared by the borrowers, so would be better modelled at this level. Legally, I suspect that all correspondence needs to be sent separately to each borrower, so we proably don't need to model a "contract" mailing address.
    # object_array_field :customer_mailing_addresses, FmDtos::AddressV1

    object_array_field :customer_incomes, FmDtos::CustomerIncomeV1
    object_array_field :customer_expenses, FmDtos::CustomerExpenseV1
    object_array_field :customer_liabilities, FmDtos::CustomerLiabilityV1
    object_array_field :customer_assets, FmDtos::CustomerAssetV1

    object_array_field :primary_applicant_shared_expenses, FmDtos::CustomerExpenseV1 # For showing shared expenses in document printing

    object_array_field :personal_references, FmDtos::PersonalReferenceV1
    object_array_field :repayments, FmDtos::RepaymentV1

    object_array_field :documents, FmDtos::ContractDocumentV1
    object_array_field :notes, FmDtos::ContractNoteV1
    object_array_field :tags, FmDtos::ContractTagV1

    object_field :payment_capacity, FmDtos::PaymentCapacityV1

    plain_field :esignature_contract_document_key
    plain_field :latest_signed_contract_content_url # This is expected to be a URL in the document repository that holds the content of the contract pdf that's been signed by the customers or executed by the financier
    plain_field :tax_jurisdiction

    plain_field :asset_use # business, private for asset loan
    dollar_field :mortgage_duty_upfront_amount
    dollar_field :mortgage_duty_amount
    boolean_field :mortgage_duty_financed
    dollar_field :document_registration_fee_amount
    boolean_field :document_registration_fee_financed

    object_array_field :finance_accessories, FmDtos::FinanceAccessoryV1
    object_array_field :requirement_and_objectives, FmDtos::RequirementAndObjectiveV1

    object_array_field :credit_approval_conditions, FmDtos::CreditApprovalConditionV1 # credit requirement and approval conditions

    object_field :business_purpose, FmDtos::BusinessPurposeV1 # business purpose declartion statement
    decimal_field :total_usage_limit

    boolean_field :debt_consolidation_acknowledgement
  end
end
