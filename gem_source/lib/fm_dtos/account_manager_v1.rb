module FmDtos
  class AccountManagerV1
    include FmDtos::FmEntityDtoV1
    def self.dto_version; 1 end

    plain_field :name
  end
end

