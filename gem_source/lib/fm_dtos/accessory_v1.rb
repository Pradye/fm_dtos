module FmDtos
  class AccessoryV1
    include FmDtos::FmEntityDtoV1
    def self.dto_version; 1 end

    integer_field :position # aka number aka index

    plain_field :reference_data_source_name # eg finance_manager_admin, entered_by_originator
    object_field :reference_data_ref, FmDtos::GenericReferenceV1

    plain_field :description
    dollar_field :price

    dollar_field :value_determined_by_origination
    plain_field :value_basis_determined_by_origination # eg redbook_new_price, entered_by_originator
    decimal_field :value_reduction_applied_by_origination # eg 0.8. If value_basis was redbook_new_price, and reduction_applied was 0.8, then the value would be 80% of the Redbook new price
  end
end
