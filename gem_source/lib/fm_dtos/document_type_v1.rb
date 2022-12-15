module FmDtos
  class DocumentTypeV1
    include FmDtos::FmEntityDtoV1
    def self.dto_version; 1 end

    plain_field :file_type
    boolean_field :active
    integer_field :position
  end
end
