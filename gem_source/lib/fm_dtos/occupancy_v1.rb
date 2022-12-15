module FmDtos
  class OccupancyV1
    include FmDtos::FmEntityDtoV1
    def self.dto_version; 1 end

    integer_field :position # aka number aka index

    integer_field :duration_months

    plain_field :purpose # residence, principal_place_of_business, principal_place_of_administration, principal_place_of_operations, registered_office

    plain_field :accommodation_status # owned, mortgaged, renting, boarding, living_with_parents, employer_provided -> and, less desirable: leased, other
    plain_field :accommodation_status_description

    object_field :address, FmDtos::AddressV1
    object_field :mailing_address, FmDtos::AddressV1
    date_field :approximate_start_date

    plain_field :landlord_or_financier_name # It is intentionally ambiguous, in that this could refer to a company (eg ANZ) or an individual. For a combination of both, we'd expect "John Smith at ANZ", though it's unlikely that we ever require both a person and a company name.
    plain_field :landlord_or_financier_primary_phone_number

    # We were previously capturing lots of information about the landlord and/or the lease, but I believe that's no longer required by anyone. Those are outlined below, but are not expected to be used
    object_field :landlord_or_financier_address, FmDtos::AddressV1
    date_field :lease_expiry_date
    plain_field :lease_term
    plain_field :lease_term_type
  end
end
