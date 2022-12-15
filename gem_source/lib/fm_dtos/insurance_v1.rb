module FmDtos
  class InsuranceV1
    include FmDtos::FmEntityDtoV1
    def self.dto_version; 1 end

    integer_field :position # aka number aka index

    object_field :insurance_type_ref, FmDtos::GenericReferenceV1 # May be null, in which case the "other type name" must be provided
    plain_field :type_internal_code
    plain_field :other_insurance_type_name
    plain_field :insurance_type_name # Either the insurance type name or the "other" type name

    object_field :insurance_product_ref, FmDtos::GenericReferenceV1 # May be null, in which case the "other type name" must be provided
    plain_field :product_internal_code
    plain_field :other_insurance_product_name
    plain_field :insurance_product_name # Either the inisurance product name or the "other" product name

    object_field :collateral_ref, FmDtos::GenericReferenceV1 # Will only be populated for insurances that cover the asset, not the finance (eg populated for motor vehicle insurance, but not for consumer credit insurance)

    boolean_field :provided_by_asset_supplier # Only relevant if this policy is covering the collateral (eg for an extended warranty product)
    boolean_field :provided_by_other_business_partner # eg an insurer configured in admin
    boolean_field :provided_by_external_named_insurer
    object_field :provider_business_partner_ref, FmDtos::GenericReferenceV1
    plain_field :external_provider_name # I'm calling these insurance providers, rather than insurers, but it could be considered synonymous
    plain_field :provider_name # This is the name of the external insurer, insurer configured as business partner, or the name of the asset supplier, if they are providing the insurance

    dollar_field :premium_amount
    boolean_field :financed

    object_field :external_provider_bank_account, FmDtos::BankAccountV1 # These banking-related fields are only relevant if the premium is being financed

    plain_field :policy_number
    boolean_field :policy_effective_at_settlement
    date_field :inception_date # If not effective only at settlement
    boolean_field :policy_expires_on_finance_completion
    integer_field :maximum_term_months
    date_field :expiry_date # If not expiring on finance completion, and no max term
  end
end
