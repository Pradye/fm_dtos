module FmDtos
  class RequirementAndObjectiveV1
    include FmDtos::FmEntityDtoV1
    def self.dto_version; 1 end

    plain_field :question_number
    plain_field :question
    plain_field :answer

    integer_field :answer_max_length
    integer_field :answer_length
    boolean_field :child_question
    integer_field :position
  end
end
