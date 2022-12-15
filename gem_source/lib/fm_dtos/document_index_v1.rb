module FmDtos
  class DocumentIndexV1 < FmDtos::GenericIndexV1
    plain_field :source
    plain_field :application_number
    plain_field :application_version
  end
end