module FmDtos
  class << self
    def configure
      @config = FmDtos::Config.new

      yield @config
    end

    def time_zone
      raise 'FmDtos requires time_zone to be set' unless config.time_zone

      config.time_zone
    end

    private

    def config
      unless @config
        raise 'FmDtos has not been configured properly - before being used it should be configured in an initialiser'
      end

      @config
    end
  end

  class Config
    attr_accessor :time_zone
  end
end

# NOTE: The above line in the fm_dtos gem does not work anymore in production
# environment for rails 5.x and 6.0
# We can enable  explicitly auto loading in production but we risk to have
# concurrency issues (which we had in origination), in some case Rails is
# not thread safe anymore.
#
# The recommended fix would be in this gem itself. (use vanilla require)
# as below.

# FIXME: add more require statements add the webapp needs it.

require 'active_support/all'

require 'dto_accessors'
require 'hashable_dto'

require 'fm_dtos/fm_entity_dto_v1'
require 'fm_dtos/financed_item_purpose_v1'

require 'fm_dtos/generic_reference_v1'
require 'fm_dtos/generic_index_v1'
require 'fm_dtos/scheduled_direct_debit_index_v1'
require 'fm_dtos/file_v1'

# admin
require 'fm_dtos/address_v1'
require 'fm_dtos/document_type_v1'
require 'fm_dtos/profit_centre_v1'
require 'fm_dtos/account_manager_v1'
require 'fm_dtos/business_partner_v1'
require 'fm_dtos/business_partner_weight_class_v1'
require 'fm_dtos/user_v4'
require 'fm_dtos/email_service_configuration_v1'
require 'fm_dtos/business_hour_v1'
require 'fm_dtos/franchise_v3'
require 'fm_dtos/region_v1'
require 'fm_dtos/custom_attribute_group_v1'
require 'fm_dtos/custom_attribute_grouping_v1'
require 'fm_dtos/application_category_rule_v1'
require 'fm_dtos/bank_branch_register_v1'
require 'fm_dtos/credit_decision_mapping_v1'

# origination
require 'fm_dtos/bank_account_v1'
require 'fm_dtos/bpay_v1'
require 'fm_dtos/payment_set_v1'
require 'fm_dtos/scheduled_direct_debit_v1'

require 'fm_dtos/address_v1'
require 'fm_dtos/occupancy_v1'
require 'fm_dtos/employment_v1'
require 'fm_dtos/trade_reference_v1'
require 'fm_dtos/risk_score_v1'
require 'fm_dtos/accountant_v1'
require 'fm_dtos/company_contact_v1'
require 'fm_dtos/retail_customer_v1'

require 'fm_dtos/contract_tag_v1'
require 'fm_dtos/contract_note_v1'
require 'fm_dtos/contract_document_v1'
require 'fm_dtos/personal_reference_v1'

require 'fm_dtos/customer_income_v1'
require 'fm_dtos/customer_asset_v1'
require 'fm_dtos/customer_liability_v1'
require 'fm_dtos/customer_expense_v1'

require 'fm_dtos/financed_item_v1'
require 'fm_dtos/traded_in_asset_v1'
require 'fm_dtos/insurance_v1'

require 'fm_dtos/accessory_v1'
require 'fm_dtos/factory_option_v1'

require 'fm_dtos/collateral_v1'

require 'fm_dtos/finance_accessory_v1'
require 'fm_dtos/service_contract_v1'
require 'fm_dtos/requirement_and_objective_v1'
require 'fm_dtos/business_purpose_v1'
require 'fm_dtos/payout_quote_v1'
require 'fm_dtos/credit_approval_condition_v1'
require 'fm_dtos/digital_id_v1'
# Credit & Settlement
require 'fm_dtos/repayment_v1'
require 'fm_dtos/payment_capacity_variable_v1'
require 'fm_dtos/payment_capacity_v1'
require 'fm_dtos/credit_decision_v1'
require 'fm_dtos/finance_agreement_v1'

# origination_express
require 'fm_dtos/settlement_decision_v1'
require 'fm_dtos/customer_v1'
require 'fm_dtos/customer_request_hardship_v1'
require 'fm_dtos/customer_request_v1'

# communication
require 'fm_dtos/communication_recipient_v1'
require 'fm_dtos/communication_event_v1'

# credit
require 'fm_dtos/review_request_v1'

# document_repository
require 'fm_dtos/document_index_v1'

# banking
require 'fm_dtos/direct_credit_v1'
require 'fm_dtos/banking_request_v1'

# wbo and wfe
require 'fm_dtos/dealership_reference_v1'
require 'fm_dtos/wholesale_drawdown_request_v1'
require 'fm_dtos/deferred_invoice_acceptance_request_v1'
require 'fm_dtos/wholesale_release_request_v1'
require 'fm_dtos/wholesale_vehicle_v1'
require 'fm_dtos/wholesale_credit_line_v1'
require 'fm_dtos/wholesale_dealership_v1'
require 'fm_dtos/wholesale_drawdown_v1'
require 'fm_dtos/wholesale_legacy_capital_loan_v1'
require 'fm_dtos/wholesale_dealership_floorplan_v1'
require 'fm_dtos/due_payment_v1'
require 'fm_dtos/wholesale_audit_status_code_v1'
require 'fm_dtos/wholesale_audit_status_v1'
require 'fm_dtos/wholesale_offset_v1'
require 'fm_dtos/wholesale_dealership_related_facility_v1'
require 'fm_dtos/wholesale_adjustment_v1'
require 'fm_dtos/wholesale_financial_event_v1'

# RCM
require 'fm_dtos/finance_product_v1'
require 'fm_dtos/contract_payment_v1'
require 'fm_dtos/account_transaction_v1'
require 'fm_dtos/financier_v1'
require 'fm_dtos/retail_contract_v1'
require 'fm_dtos/hardship_request_v1'
require 'fm_dtos/debt_assignment_v1'

require 'fm_dtos/restructure_request_v1'
require 'fm_dtos/hardship_restructure_request_v1'

# Commissions
require 'fm_dtos/tax_invoice_v1'
