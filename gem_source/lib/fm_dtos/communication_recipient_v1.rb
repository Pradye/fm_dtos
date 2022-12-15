module FmDtos
  class CommunicationRecipientV1
    include FmDtos::FmEntityDtoV1
    def self.dto_version; 1 end

    plain_field   :recipient
    plain_field   :name
    plain_field   :address
    plain_field   :type # eg person, company, user
    plain_field   :role # Additional information about user eg applicant, guarantor. (optional)
  end
end
