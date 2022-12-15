module FmDtos
  class BusinessPartnerV1
    include FmDtos::FmEntityDtoV1
    def self.dto_version; 1 end

    plain_field :name
    plain_field :registered_name
    plain_field :nz_gst_registration_number
    plain_field :nz_company_number
    plain_field :phone
    plain_field :fax
    plain_field :email
    plain_field :roles
    plain_field :active
    plain_field :abn
    plain_field :acn
    plain_field :mobile
    plain_field :dealership_number
    plain_field :dealership_licence_number
    plain_field :credit_licence_number
    plain_field :wholesale_code
    plain_field :credit_licence_status
    plain_field :insurance_originator_code

    object_field :account_manager, FmDtos::AccountManagerV1
    object_field :address, FmDtos::AddressV1, default_to_empty: true
    object_field :parent_partner, FmDtos::GenericReferenceV1
    object_field :region, FmDtos::GenericReferenceV1
    object_field :financier, FmDtos::GenericReferenceV1
    object_field :weight_class_ref, FmDtos::GenericReferenceV1
  end
end
