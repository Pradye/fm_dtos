module FmDtos
  class BusinessHourV1
    include FmDtos::FmEntityDtoV1

    def self.dto_version; 1 end

    plain_field :day_of_week
    plain_field :start_time
    plain_field :end_time
  end
end
