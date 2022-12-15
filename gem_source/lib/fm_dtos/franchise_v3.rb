# frozen_string_literal: true

module FmDtos
  class FranchiseV3
    include FmDtos::FmEntityDtoV1
    def self.dto_version
      3
    end

    plain_field :name
    plain_field :name_2
    plain_field :code
    plain_field :external_id
    plain_field :incoming_third_party_code
    plain_field :third_party_tags

    plain_field :brand_code
    plain_field :legal_entity_name
    plain_field :secondary_legal_entity_name
    plain_field :legal_entity_name_1
    plain_field :legal_entity_name_2
    plain_field :default_make_code

    object_field :screen_logo_file, FmDtos::FileV1
    object_field :alternative_screen_logo_file, FmDtos::FileV1
    object_field :screen_logo_insurance_file, FmDtos::FileV1
    object_field :document_logo_1_file, FmDtos::FileV1
    object_field :document_logo_2_file, FmDtos::FileV1

    plain_field :colour_1
    plain_field :colour_2
    plain_field :colour_3
    plain_field :colour_4
    plain_field :phone_number_1
    plain_field :phone_number_2
    plain_field :phone_number_3
    plain_field :phone_number_4
    plain_field :website_url_1
    plain_field :website_url_2
    plain_field :documentation_website_url_1
    plain_field :documentation_website_url_2
    plain_field :documentation_email_address_1
    plain_field :documentation_email_address_2
    plain_field :document_font_1
    plain_field :document_font_2

    plain_field :ola_javascripts
    plain_field :ola_header_html
    plain_field :ola_footer_html
    plain_field :ola_fallback_url
    plain_field :ola_domain
    plain_field :ola_from_email_address

    plain_field :origination_domain

    plain_field   :banking_identifier_prefix
    integer_field :banking_biller_code
    plain_field   :banking_remitter_name

    plain_field :customer_disclosure_text
    plain_field :risk_score_disclosure_text

    object_field :email_service_configuration, FmDtos::EmailServiceConfigurationV1

    object_array_field :dealerships, FmDtos::GenericReferenceV1
    object_field :ola_default_business_partner, FmDtos::GenericReferenceV1
    object_field :parent_franchise_ref, FmDtos::GenericReferenceV1
    object_array_field :financed_item_purposes, FmDtos::FinancedItemPurposeV1

    object_array_field :business_hours, FmDtos::BusinessHourV1
  end
end
