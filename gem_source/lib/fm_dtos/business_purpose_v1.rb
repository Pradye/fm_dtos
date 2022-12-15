module FmDtos
    class BusinessPurposeV1
      include FmDtos::FmEntityDtoV1
      def self.dto_version
        1
      end

      boolean_field :self_employed

      plain_field :australian_business_number
      plain_field :business_name
      plain_field :business_type
      plain_field :vehicle_purpose
    end
end
