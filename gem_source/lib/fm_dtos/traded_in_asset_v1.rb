module FmDtos
  class TradedInAssetV1
    include FmDtos::FmEntityDtoV1
    def self.dto_version; 1 end

    integer_field :position # aka number aka index

    plain_field :asset_class # motor_vehicle, other

    plain_field :reference_data_source_name # eg australian_glass_guide, nz_redbook, not_in_guide
    object_field :reference_data_ref, FmDtos::GenericReferenceV1
    plain_field :manufacturer_asset_code # Mostly relevant when reference data id is not available
    plain_field :guide_asset_code # Eg NVIC, when australian glass guide is used

    integer_field :model_year
    plain_field :make
    plain_field :category
    plain_field :family_or_model
    plain_field :variant
    plain_field :drivetrain

    plain_field :registration_jurisdiction # Such as state code
    plain_field :registration_number

    plain_field :vehicle_identification_number
    plain_field :hull_identification_number
    plain_field :engine_number

    dollar_field :refund_amount # Some of the trade-in amount will be used like a deposit on the new finance contract, but the customer can choose to take some of it as cash from the dealer. This represents the amount taken as cash.

    dollar_field :finance_payout_amount # This is to pay out an old finance contract for this asset. The "old" finance contract remains active until agreement to settle the new finance.
    boolean_field :finance_payout_is_internal
    plain_field :finance_payout_to_financier_name
    plain_field :finance_payout_contract_number
  end
end

