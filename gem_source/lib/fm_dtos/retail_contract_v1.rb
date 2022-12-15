module FmDtos
  class RetailContractV1
    include FmDtos::FmEntityDtoV1
    def self.dto_version; 1 end

    plain_field    :type
    plain_field    :contract_number
    integer_field  :contract_version
    plain_field    :credit_analyst_comments
    plain_field    :settlement_comments
    plain_field    :contact_full_name
    boolean_field  :refinance
    plain_field    :payment_method
    plain_field    :contact_phone_number
    plain_field    :contact_email_address
    plain_field    :status_code
    plain_field    :origination_company_type
    plain_field    :origination_person_full_name
    plain_field    :restructure_application_number

    boolean_field  :aware_of_financial_position_changes
    plain_field    :financial_position_changes_description
    integer_field  :term
    plain_field    :payment_frequency
    decimal_field  :interest_rate
    decimal_field  :balloon_percentage
    decimal_field  :balloon_amount
    decimal_field  :residual_gst
    plain_field    :calculation_based_balloon_type
    plain_field    :payment_timing
    boolean_field  :vary_first_rental
    boolean_field  :use_structured_payments
    plain_field    :tax_jurisdiction
    datetime_field :requested_contract_start_date
    datetime_field :actual_contract_start_date
    decimal_field  :monthly_account_keeping_fee
    decimal_field  :cash_deposit
    decimal_field  :origination_fee
    decimal_field  :establishment_fee_financed
    decimal_field  :establishment_fee_upfront
    decimal_field  :document_registration_fee_financed
    decimal_field  :document_registration_fee_upfront
    decimal_field  :mortgage_duty_financed
    decimal_field  :mortgage_duty_upfront
    decimal_field  :total_amount_financed
    datetime_field :created_at
    datetime_field :closure_timestamp
    plain_field    :closure_reason
    plain_field    :closure_note
    boolean_field  :termination_fee_waived
    plain_field    :credit_score_card
    boolean_field  :collect_vehicle_on_closure
    boolean_field  :suppress_letters_on_closure
    plain_field    :campaign_code
    datetime_field :credit_approved_at
    plain_field    :fleet_code
    plain_field    :origination_person_email_address
    plain_field    :origination_person_phone_number
    plain_field    :refinance_contract_number
    decimal_field  :regular_payment_debit_fee
    datetime_field :settled_at
    decimal_field  :unsecured_amount_financed
    datetime_field :sent_welcome_letter_at
    decimal_field  :initial_termination_fee
    decimal_field  :termination_fee_periodic_amount
    decimal_field  :termination_fee_discount_percentage
    decimal_field  :ppsr_fee
    boolean_field  :minimum_taxable_supply_certified
    decimal_field  :securities_insurance_amount
    plain_field    :signature_method
    datetime_field :generated_welcome_letter_at
    decimal_field  :early_termination_flat_fee_amount
    plain_field    :early_termination_fee_type
    plain_field    :originator_comments
    plain_field    :full_external_reference_number
    decimal_field  :purchase_amount_gst_financed
    decimal_field  :base_rate
    datetime_field :first_credit_approval_at
    decimal_field  :original_balloon_amount
    plain_field    :campaign_name
    plain_field    :campaign_source
    plain_field    :campaign_source_key
    plain_field    :original_payment_frequency
    decimal_field  :original_residual_gst
    plain_field    :borrower_names
    decimal_field  :pre_discount_termination_fee_net
    decimal_field  :pre_discount_termination_fee_gst
    decimal_field  :unearned_interest_amount_at_settlement
    plain_field    :primary_purpose
    boolean_field  :nominate_repayment
    datetime_field :nominated_repayment_date
    plain_field    :nominated_repayment_day
    plain_field    :nominated_repayment_day_of_month
    datetime_field :restructured_at
    plain_field    :restructure_reason
    boolean_field  :waive_dishonour_fee
    boolean_field  :hardship
    decimal_field  :gst_on_term_charges
    decimal_field  :lvr_at_credit_approval

    datetime_field :expected_termination_date

    decimal_field  :payout_amount
    decimal_field  :loan_balance

    object_field   :branding_franchise_ref, FmDtos::GenericReferenceV1

    object_array_field :scheduled_direct_debits, FmDtos::ScheduledDirectDebitV1
    object_array_field :contract_payments, FmDtos::ContractPaymentV1
    object_array_field :due_payments, FmDtos::DuePaymentV1
    object_array_field :collateral_items, FmDtos::CollateralV1

    object_field       :bank_account, FmDtos::BankAccountV1
    object_field       :finance_product, FmDtos::FinanceProductV1

    object_field       :retail_agreement_document, FmDtos::ContractDocumentV1
    object_array_field :documents, FmDtos::ContractDocumentV1
    object_field       :financier, FmDtos::FinancierV1
    object_array_field :pending_requests, FmDtos::CustomerRequestV1
    object_array_field :repayments, FmDtos::RepaymentV1
    object_array_field :parties, FmDtos::RetailCustomerV1
  end
end
