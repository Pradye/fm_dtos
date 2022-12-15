# frozen_string_literal: true

module FmDtos
  # DTO representing and applicant on a retail finance contract.
  class RetailCustomerV1
    include FmDtos::FmEntityDtoV1

    def self.dto_version
      1
    end

    boolean_field :applicant
    boolean_field :guarantor
    boolean_field :other_party
    plain_field :other_party_description

    integer_field :party_number
    plain_field :role # one of applicant or guarantor

    boolean_field :individual
    boolean_field :acting_as_commercial_entity

    plain_field :title
    plain_field :first_name
    plain_field :middle_name
    plain_field :last_name
    plain_field :also_known_as
    plain_field :accommodation_details_type
    plain_field :marital_status
    boolean_field :spouse_of_primary_borrower
    plain_field :gender
    integer_field :number_of_dependents
    integer_field :number_of_adult_dependents
    integer_field :number_of_child_dependents

    plain_field :trading_name
    plain_field :registered_name
    plain_field :years_established # if customer is company, years established
    plain_field :company_type

    plain_field :customer_type
    decimal_field :annual_turnover
    integer_field :months_in_business
    integer_field :number_of_employees
    plain_field :accountant_name
    plain_field :company_name
    plain_field :abn
    plain_field :acn
    plain_field :gst_reg_num
    integer_field :number_of_directors
    boolean_field :full_disclaimer_checked
    boolean_field :as_company_contact
    object_field :company_mailing_address, FmDtos::AddressV1
    object_field :accountant, FmDtos::AccountantV1
    object_array_field :company_contacts, FmDtos::CompanyContactV1

    # MP: This is a poor model of the relationship with a trust, but is
    #     currently all that we require. We use the presence of this field to
    #     imply that this customer is acting in their capacity as trustee of the
    #     named trust (which is only allowed on commercial deals)
    plain_field :trust_name
    plain_field :trust_abn
    plain_field :legal_borrower_name

    plain_field :australian_business_number
    plain_field :australian_company_number
    plain_field :nz_company_number
    plain_field :nz_business_number
    plain_field :nz_gst_registration_number

    # Only relevant when the customer is not an individual. This represents the
    # person to contact at the organisation
    plain_field :contact_person_name

    plain_field :primary_phone_number
    boolean_field :primary_phone_is_mobile
    plain_field :secondary_phone_number
    boolean_field :secondary_phone_is_mobile

    plain_field :fax_number

    plain_field :email_address

    plain_field :mobile_number_verification_code
    plain_field :email_address_domain_verification_code
    plain_field :email_address_verification_code

    plain_field :country_of_birth
    plain_field :place_of_birth
    date_field :date_of_birth
    plain_field :last_name_at_birth

    boolean_field :partner_contributes_to_expenses # Aka "partner is employed"
    plain_field :partner_first_name
    plain_field :partner_last_name

    # australia, new_zealand, overseas_driving_on_ left,
    # overseas_driving_on_right
    plain_field :driver_licence_origin_country

    plain_field :driver_licence_origin_state_code

    # full_unrestricted, full_restricted, learner, probationary
    plain_field :driver_licence_type

    plain_field :driver_licence_number
    plain_field :driver_licence_card_number
    plain_field :driver_licence_additional_identifier
    datetime_field :driver_licence_expires_at

    boolean_field :australian_citizen
    boolean_field :new_zealand_citizen
    plain_field :passport_country
    plain_field :passport_number
    date_field :passport_expiry_date

    boolean_field :name_was_different_at_citizenship
    plain_field :first_name_at_citizenship
    plain_field :middle_name_at_citizenship
    plain_field :last_name_at_citizenship

    plain_field :medicare_card_number
    integer_field :medicare_card_position
    plain_field :medicare_card_colour
    date_field :medicare_card_expiry_date

    plain_field :proof_of_age_state_code
    plain_field :proof_of_age_id_number
    date_field :proof_of_age_expiry_date

    # accountant_authorised_to_supply, current_figures_available,
    # current_statement_already_sent
    plain_field :status_of_business_finance_information

    plain_field :accountant_contact_person_name
    plain_field :accountant_company_name
    plain_field :accountant_primary_phone_number
    boolean_field :accountant_primary_phone_is_mobile
    plain_field :accountant_secondary_phone_number
    boolean_field :accountant_secondary_phone_is_mobile
    object_field :accountant_address, FmDtos::AddressV1

    boolean_field :aml_ctf_confirmation
    boolean_field :privacy_consent_provided
    boolean_field :electronic_communication_acknowledgement
    boolean_field :agreed_to_electronic_signature_disclosure
    boolean_field :accuracy_acknowledgement
    boolean_field :discretionary_expenses_acknowledgement
    boolean_field :equifax_ve_acknowledgement

    plain_field :customer_consented_to_marketing_methods
    plain_field :customer_declined_marketing_methods

    # on_paper, electronic, remote_electronic
    plain_field :contract_signing_method

    # not_started, declined_terms, partially_complete, complete
    plain_field :contract_signing_status

    # eg applicant_1, dd_authoriser, guarantor_1
    plain_field :contract_signing_for_roles

    integer_field :risk_score

    plain_field :primary_income_frequency

    object_array_field :occupancies, FmDtos::OccupancyV1

    object_array_field :mailing_addresses, FmDtos::AddressV1

    object_array_field :employments, FmDtos::EmploymentV1
    object_array_field :contacts, FmDtos::CompanyContactV1
    object_array_field :accountants, FmDtos::AccountantV1

    object_array_field :trade_references, FmDtos::TradeReferenceV1
    object_array_field :risk_subscores, FmDtos::RiskScoreV1

    plain_field :industry_code
    plain_field :sub_industry_code

    plain_field :industry_description
    plain_field :sub_industry_description

    boolean_field :access_seeker_authorisation
  end
end
