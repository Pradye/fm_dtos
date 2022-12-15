module FmDtos
  class AddressV1
    include FmDtos::FmEntityDtoV1
    def self.dto_version; 1 end

    # address_type matters to NZ post and couriers
    # possible examples of valid values are "urban" & "rural"
    plain_field :address_type
    plain_field :type_code # street or po_box

    plain_field :country
    plain_field :postcode
    plain_field :state_or_region
    plain_field :city_or_shire
    plain_field :locality # suburb_or_town
    plain_field :sub_locality # Neighbourhood (comes from geocoding)

    plain_field :street_name
    plain_field :street_type

    plain_field :property_name
    plain_field :street_number
    plain_field :unit_number # Or level, if relevant...

    plain_field :po_box

    plain_field :formatted_as_single_line

    plain_field :formatted_line_1_of_2
    plain_field :formatted_line_2_of_2

    plain_field :formatted_line_1_of_3
    plain_field :formatted_line_2_of_3
    plain_field :formatted_line_3_of_3

    plain_field :geocode_string
  end
end
