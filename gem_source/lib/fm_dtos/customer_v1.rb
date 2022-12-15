module FmDtos
  class CustomerV1
    include FmDtos::FmEntityDtoV1
    def self.dto_version; 1 end

    boolean_field :individual

    plain_field :title
    plain_field :first_name
    plain_field :middle_name
    plain_field :last_name
    plain_field :marital_status
    # boolean_field :spouse_of_primary_borrower
    plain_field :gender
    integer_field :number_of_dependents

    plain_field :trading_name
    plain_field :registered_name
    plain_field :trust_name # MP: This is a poor model of the relationship with a trust, but is currently all that we require. We use the presence of this field to imply that this customer is acting in their capacity as trustee of the named trust (which is only allowed on commercial deals)
    plain_field :trust_abn
    plain_field :legal_borrower_name

    plain_field :australian_business_number
    plain_field :australian_company_number
    plain_field :nz_company_number
    plain_field :new_zealand_business_number
    plain_field :nz_gst_registration_number

    plain_field :contact_person_name # Only relevant when the customer is not an individual. This represents the person to contact at the organisation

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

    plain_field :driver_licence_origin_country # australia, new_zealand, overseas_driving_on_ left, overseas_driving_on_right
    plain_field :driver_licence_origin_state_code
    plain_field :driver_licence_type # full_unrestricted, full_restricted, learner, probationary
    plain_field :driver_licence_number
    integer_field :driver_licence_card_number # Deprecated
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

    plain_field :status_of_business_finance_information # accountant_authorised_to_supply, current_figures_available, current_statement_already_sent
    plain_field :accountant_contact_person_name
    plain_field :accountant_company_name
    plain_field :accountant_primary_phone_number
    boolean_field :accountant_primary_phone_is_mobile
    plain_field :accountant_secondary_phone_number
    boolean_field :accountant_secondary_phone_is_mobile
    object_field :accountant_address, FmDtos::AddressV1
    object_field :digital_id, FmDtos::DigitalIdV1

    plain_field :customer_number
    boolean_field :hardship

    object_array_field :occupancies, FmDtos::OccupancyV1

    object_array_field :mailing_addresses, FmDtos::AddressV1

    object_array_field :employments, FmDtos::EmploymentV1

    object_array_field :trade_references, FmDtos::TradeReferenceV1

    object_array_field :bank_accounts, FmDtos::BankAccountV1

    object_field :pending_customer_detail_request_ref, FmDtos::GenericReferenceV1
    object_field :pending_customer_address_request_ref, FmDtos::GenericReferenceV1
    object_field :pending_customer_employment_request_ref, FmDtos::GenericReferenceV1

    plain_field :industry_code
    plain_field :sub_industry_code

    plain_field :industry_description
    plain_field :sub_industry_description
  end
end
