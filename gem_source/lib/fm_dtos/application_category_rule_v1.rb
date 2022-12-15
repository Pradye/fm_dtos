module FmDtos
  class ApplicationCategoryRuleV1
    include FmDtos::FmEntityDtoV1
    def self.dto_version; 1 end

    plain_field :name
    integer_field :priority
    decimal_field :minimum_net_amount_financed
    decimal_field :maximum_net_amount_financed

    object_array_field :included_franchise_refs, FmDtos::GenericReferenceV1
    object_array_field :included_finance_product_refs, FmDtos::GenericReferenceV1
  end
end
