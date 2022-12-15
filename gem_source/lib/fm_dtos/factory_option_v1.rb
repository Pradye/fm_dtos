module FmDtos
  class FactoryOptionV1
    include FmDtos::FmEntityDtoV1
    def self.dto_version; 1 end

    integer_field :position # aka number aka index

    plain_field :reference_data_source_name # eg australian_glass_guide, nz_redbook
    object_field :reference_data_ref, FmDtos::GenericReferenceV1
    plain_field :manufacturer_option_code
    plain_field :guide_option_code

    plain_field :description

    dollar_field :price
    dollar_field :value_determined_by_origination
    plain_field :value_basis_determined_by_origination

    dollar_field :residual_value_determined_by_origination
  end
end

