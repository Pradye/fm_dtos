module FmDtos
  class EmailServiceConfigurationV1
    include FmDtos::FmEntityDtoV1
    def self.dto_version; 1 end

    plain_field     :smtp_address
    integer_field   :smtp_port
    plain_field     :authentication_type
    boolean_field   :enable_starttls_auto
    plain_field     :domain
    plain_field     :from
    plain_field     :user_name
    plain_field     :encrypted_password
    plain_field     :notifications_to

    object_field    :franchise_ref, FmDtos::GenericReferenceV1
  end
end
