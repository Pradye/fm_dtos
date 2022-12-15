module FmDtos
  class EmploymentV1
    include FmDtos::FmEntityDtoV1
    def self.dto_version; 1 end

    integer_field :position # aka number aka index
    integer_field :duration_months

    boolean_field :current_at_time_of_origination

    # This is not for sole-trader information where the sole-trader is applying as a commercial entity
    plain_field :employment_status # self_employed, permanent_full_time, permanent_part_time, contractor, casual, seasonal, unemployed, retired -> though I think that "seasonal" is a type of casual...

    plain_field :occupation_group # manager, professional, technician_or_associated_professional, clerical_support, service_and_sales, skilled_agricultural_forestry_or_fishery,  craft_and_related_trades, plant_or_machine_operator_or_assembler, elementary_occupation, armed_forces_occupation

    plain_field :job_description

    plain_field :employer_trading_name
    plain_field :employer_registered_name

    plain_field :employer_australian_business_number
    plain_field :employer_australian_company_number
    plain_field :employer_nz_company_number
    plain_field :employer_nz_gst_registration_number

    plain_field :employer_contact_name

    plain_field :employer_primary_contact_phone_number
    boolean_field :employer_primary_contact_phone_is_mobile
    plain_field :employer_secondary_contact_phone_number
    boolean_field :employer_secondary_contact_phone_is_mobile

    plain_field :employer_fax_number

    object_field :place_of_business_address, FmDtos::AddressV1

    date_field :approximate_start_date

    plain_field :industry_code
    plain_field :sub_industry_code

    plain_field :industry_description
    plain_field :sub_industry_description
  end
end
