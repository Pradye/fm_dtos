module FmDtos
  class CustomerRequestHardshipV1
    include FmDtos::FmEntityDtoV1
    def self.dto_version; 1 end

    plain_field :first_name
    plain_field :middle_name
    plain_field :last_name
    plain_field :home_phone_number
    plain_field :mobile_phone_number
    plain_field :work_phone_number
    plain_field :marital_status
    integer_field :number_of_dependents

    object_field :address, FmDtos::AddressV1

    plain_field :employer_name

    object_field :employer_address, FmDtos::AddressV1

    plain_field :hardship_reason
    integer_field :hardship_months
    plain_field :hardship_contracts
    plain_field :hardship_recovery_note

    decimal_field :income_salary_wages_pension
    decimal_field :income_rent_board
    decimal_field :income_centrelink
    decimal_field :income_other

    decimal_field :liability_mortgage_balance
    decimal_field :liability_mortgage_repayment
    decimal_field :liability_credit_card_balance
    decimal_field :liability_credit_card_repayment
    decimal_field :liability_loan_balance
    decimal_field :liability_loan_repayment
    decimal_field :liability_other_balance
    decimal_field :liability_other_repayment

    decimal_field :expense_food
    decimal_field :expense_accommodation
    decimal_field :expense_utilities
    decimal_field :expense_travel
    decimal_field :expense_clothing_medical
    decimal_field :expense_dependents
    decimal_field :expense_other
  end
end
