module FmDtos
  class FileV1
    include FmDtos::FmEntityDtoV1
    def self.dto_version; 1 end

    plain_field  :content_type
    plain_field  :name
    plain_field  :original_filename
    plain_field  :url

    binary_field :content
    alias_method :read, :content_decoded
  end
end

