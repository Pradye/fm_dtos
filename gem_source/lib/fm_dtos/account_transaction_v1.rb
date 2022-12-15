module FmDtos
  class AccountTransactionV1
    include FmDtos::FmEntityDtoV1
    def self.dto_version; 1 end

    decimal_field   :amount
    decimal_field   :running_balance
    plain_field     :transaction_type
    datetime_field  :effective_date
  end
end
