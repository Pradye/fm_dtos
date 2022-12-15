module FmDtos
  class ContractDocumentV1
    include FmDtos::FmEntityDtoV1
    def self.dto_version; 1 end

    object_field :finance_agreement_ref, FmDtos::GenericReferenceV1
    object_field :file, FmDtos::FileV1

    object_array_field :document_types, FmDtos::GenericReferenceV1
    object_array_field :referenced_parties, FmDtos::GenericReferenceV1

    plain_field :document_type
    plain_field :other_type_description

    plain_field :file_name
    plain_field :content_type
    plain_field :content_url # Note that we'll never synch the raw content - we must first send the document to the document repository, then synch only the url to the document
    boolean_field :external_url # This really is just about whether or not we expose the URL directly to the user's browser, or we just render the contents. If the document is in our document repository, we render the content, but if it's from an external URL, I would expect that we would open a window with that location

    plain_field :created_by_username
    plain_field :deleted_by_username

    plain_field :application_number
    plain_field :application_version
    plain_field :status_code
    plain_field :note_text
    plain_field :url
  end
end
