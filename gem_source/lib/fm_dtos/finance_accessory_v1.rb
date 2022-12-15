module FmDtos
  class FinanceAccessoryV1
    include FmDtos::FmEntityDtoV1
    def self.dto_version
      1
    end

    plain_field :code
    plain_field :incoming_third_party_code
    plain_field :accessory_name
    boolean_field :has_quantity

    # default
    dollar_field :default_price
    integer_field :default_quantity
    integer_field :maximum_quantity

    # dealers provided price and quantity
    dollar_field :price
    integer_field :quantity
    dollar_field :total_price

    plain_field :supplier_name
  end
end
