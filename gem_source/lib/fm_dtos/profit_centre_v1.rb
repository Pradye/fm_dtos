module FmDtos
  class ProfitCentreV1
    include FmDtos::FmEntityDtoV1
    def self.dto_version; 1 end

    plain_field :name
    plain_field :code
    integer_field :priority

    plain_field :make_operator
    plain_field :age_status_operator 
    plain_field :posting_system_operator 
    plain_field :dealership_one_operator
    plain_field :dealership_two_operator
    plain_field :finance_product_operator

    plain_field :applicable_makes
    plain_field :applicable_age_statuses 
    plain_field :applicable_posting_systems 
    plain_field :applicable_dealership_one_ids
    plain_field :applicable_dealership_two_ids
    plain_field :applicable_finance_product_ids

    boolean_field :active
  end
end
