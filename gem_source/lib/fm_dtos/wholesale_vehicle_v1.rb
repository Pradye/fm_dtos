module FmDtos
  class WholesaleVehicleV1
    include FmDtos::FmEntityDtoV1
    def self.dto_version; 1 end

    object_field :floorplan_ref, FmDtos::GenericReferenceV1

    plain_field :unit_number
    integer_field :year
    plain_field :make
    plain_field :family
    plain_field :variant
    plain_field :drivetrain
    plain_field :vin
    plain_field :engine_number
    plain_field :vehicle_age_status
    plain_field :registration_state_code
    plain_field :registration
    plain_field :supplier_stock_number
    plain_field :dealership_stock_number
    plain_field :manufacturer_asset_code
    datetime_field :date_added_to_plan
    dollar_field :payout_amount
    dollar_field :invoiced_net_amount
    dollar_field :invoiced_gst_amount
    dollar_field :original_loan_amount
    dollar_field :initial_security_deposit_due
    plain_field :currently_on_plan
    plain_field :colour
    integer_field :kms
    datetime_field :sale_date
    datetime_field :followup_date
    plain_field :can_be_transferred_to_demo
    plain_field :can_be_transferred_to_other_dealership
    plain_field :wholesale_audited_vehicle_status_desc
    plain_field :wholesale_audited_vehicle_status_code
    datetime_field :disbursement_due_at
    plain_field :disbursement_status
    plain_field :manufacturer_serial_number
    plain_field :wholesale_vehicle_type

    object_field :audit_status_ref, FmDtos::GenericReferenceV1
  end
end
