module FmDtos
  class RepaymentV1
    include FmDtos::FmEntityDtoV1
    def self.dto_version; 1 end

    datetime_field  :date
    decimal_field   :p_and_i_amount
    decimal_field   :gst_on_p_and_i_amount
    decimal_field   :akf_amount
    decimal_field   :gst_on_akf_amount
    plain_field     :status_code
    decimal_field   :debit_fee_amount
    boolean_field   :is_balloon
    boolean_field   :fixed
    boolean_field   :hardship
  end
end
