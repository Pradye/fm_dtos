module FmDtos
  class CollateralV1
    include FmDtos::FmEntityDtoV1
    def self.dto_version; 1 end

    integer_field :position # aka number aka index

    boolean_field :unspecified

    plain_field :asset_class # motor_vehicle, caravan, boat, other
    plain_field :age_group # one of new, demo or used
    plain_field :asset_age # one of 0 (0-23 months), 1 (2-4 years) or 2 (5+ years)

    plain_field :reference_data_source_name # eg australian_glass_guide, nz_redbook, not_in_guide
    object_field :reference_data_ref, FmDtos::GenericReferenceV1
    plain_field :manufacturer_asset_code # Mostly relevant when reference data id is not available
    plain_field :guide_asset_code # Eg NVIC, when australian glass guide is used

    boolean_field :is_used
    boolean_field :is_demonstrator

    boolean_field :fuel_efficient
    boolean_field :is_hail_damaged
    boolean_field :taxi_or_rental

    integer_field :model_year

    integer_field :compliance_year
    integer_field :compliance_month # 1 = January, 12 = December

    date_field :build_date

    boolean_field :new_zealand_new
    date_field :first_registration_date # This is really only captured for NZ vehicles (particularly grey imports), where the model year is well behind the importation year

    plain_field :make
    plain_field :category
    plain_field :family_or_model # Also boat type. This is really just the first level of specification after identifying the make
    plain_field :variant # Second level of specification
    plain_field :drivetrain # Also boat engine description. Describes the way the vehicle is powered - engine type & size, ignition & value description, type of fuel, and transmission type & gears. Potentially axle, wheel and tyre info, if relevant, though those will usually be considered either options or variants. The drive train describes everything from the fuel to the substrate used for propulsion (the road, water or air)
    plain_field :secondary_drivetrain # For boats, where relevant (eg an electric motor as second source of power)
    plain_field :series
    plain_field :style # the style of boat
    plain_field :model_code # the model code of boat
    plain_field :axle # the axle of caravan
    plain_field :berths # the berths of caravan
    plain_field :transmission_description # This and the following field may be required in documentation, and we would expect them to come from the reference data (Redbook or Glass Guide)
    plain_field :body_type_description

    plain_field :additional_or_other_description

    integer_field :boat_length_metres
    plain_field :boat_trailer_description # _not_ for heavy vehicle trailers, which are considered independent collateral

    plain_field :vehicle_identification_number
    plain_field :hull_identification_number
    plain_field :engine_number
    plain_field :secondary_drivetrain_engine_number
    plain_field :engine_size

    boolean_field :vin_validated
    boolean_field :vin_validation_overridden

    plain_field :registration_jurisdiction # Such as state code
    plain_field :registration_number
    plain_field :vin_number
    plain_field :trailer_registration_jurisdiction
    plain_field :trailer_registration_number

    plain_field :garaged_jurisdiction # Really, this is unrelated to the use as collateral....

    plain_field :exterior_colour
    plain_field :interior_colour

    integer_field :initial_odometer_reading

    object_array_field :factory_options, FmDtos::FactoryOptionV1
    object_array_field :accessories, FmDtos::AccessoryV1

    boolean_field :subject_to_luxury_car_tax

    dollar_field :value_determined_by_origination
    plain_field :value_basis_determined_by_origination # eg reference_data_new_price, entered_by_originator
    decimal_field :value_reduction_applied_by_origination # eg 0.8. If value_basis was reference_data_new_price, and reduction_applied was 0.8, then the value would be 80% of the Redbook (or Glass) new price

    dollar_field :value_determined_during_credit_assessment # Important for the LVR or VLR calculation
    plain_field :value_basis_determined_during_credit_assessment
    decimal_field :value_basis_reduction_applied_during_credit_assessment


    dollar_field :residual_value_amount_determined_by_origination # This value depends on the term of the finance, so it's ugly being sent on the collateral itself. It is definitely a feature of the collateral (in that it represents the value of the secured asset at the term of the lease), but it doesn't have an obvious role in the data model.
    dollar_field :residual_value_gst_amount_determined_by_origination
    object_field :residual_value_table_ref, FmDtos::GenericReferenceV1

    dollar_field :current_residual_value_amount # This still represents the value at the term of the contract, but since the term of the contract may be changed in contract management, this value may not always be the same as that agreed in origination
    dollar_field :current_residual_value_gst_amount

    dollar_field :new_price
    dollar_field :good_retail_price
    dollar_field :average_retail_price
    dollar_field :good_wholesale_price
    dollar_field :average_wholesale_price

    boolean_field :manual_entry
  end
end

