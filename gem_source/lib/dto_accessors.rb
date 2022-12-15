# This module provides the DSL we use for defining the field types transferred
# on the dtos between modules
#
# Available datatypes are:
#
# plain_field: No transformation is done (the same as attr_accessor)
#
# integer_field: Data is converted to an integer, no matter it original representation
#
# timestamp_field: Used for transmitting accurate (to 10us) timestamps. This is
# useful for comparing update timestamps, where a simple datetime field is not
# comparable. The setter can set either a Time object or a numeric, but the
# receiver will always receive a float. If a field is defined as a timestamp
# field, it can still be accessed as a datetime on the receiving end, if
# required, by appending _datetime to the getter method (eg if we have
# timestamp_field :updated_at, then we can access updated_at_as_datetime on the
# receiver and get back a Time object instead of a float)
#
# datetime_field: Used for transmitting Time objects where precision and
# consistency are not so important. We can get a unix timestamp on the receiving
# side by appending _as_timestamp to the getter method, if required.
#
# date_field: Transmits only the date. The object set on this field must respond
# to to_date, so if converting a DateTime or Time object, care must be taken to
# ensure that the date portion is correct in the time zone of the setter. The
# receiver will receive a Date, not a datetime.
#
# dollar_field: Allows transmission of money-type fields, with truncation to the
# nearest cent. The setter can set a BigDecimal or Money value and it will be
# converted appropriately. The receiver by default will get back a BigDecimal in
# dollars (with cents expressed as decimals), but if the receiver appends
# _as_money to the getter method, they will get a Money object. If they append
# _as_cents, they will get an integer, representing the number of cents.
#
# decimal_field: Converts the value set to decimal without rounding. This is
# expected to be used for interest rates, but otherwise its use would be
# expected to be rare.
#
# object_field: Encodes another object (which also needs to implement
# HashableDto) as an association. The object may simply be a reference (ie just
# contain an entity_key) or it may be a fully populated object.
#
#
# For each of the above datatypes there are also explicit array accessors
# available. These are declared by including the word "array_" before the word
# field.
#
# Those are: plain_array_field, integer_array_field, timestamp_array_field,
# datetime_array_field, date_array_field, dollar_array_field,
# decimal_array_field, object_array_field
#

require 'base64'

module DtoAccessors
  attr_accessor :dto_version

  def object_field(assoc_name, entity_dto_class, default_to_empty: false)
    add_defined_fields(__method__, assoc_name, entity_dto_class)
    define_method "build_#{assoc_name}_dto" do
      entity_dto_class.new
    end

    define_method "#{assoc_name}=" do |assoc|
      raise "You tried to set #{assoc_name} on a #{self.class.name} to an instance of #{assoc.class.name}, but it needs to be a #{entity_dto_class.name}" if assoc && !assoc.is_a?(entity_dto_class)
      instance_variable_set("@#{assoc_name}", assoc)
    end
    if default_to_empty
      define_method assoc_name do
        result = instance_variable_get("@#{assoc_name}")
        unless result.present?
          result = entity_dto_class.new
          instance_variable_set("@#{assoc_name}", result)
        end
        result
      end
    else
      define_method assoc_name do
        instance_variable_get("@#{assoc_name}")
      end
    end
  end

  def object_array_field(assoc_name, entity_dto_class)
    add_defined_fields(__method__, assoc_name, entity_dto_class)
    define_method "build_array_#{assoc_name}_dto" do
      entity_dto_class.new
    end
    define_method "#{assoc_name}=" do |assoc_array|
      (assoc_array || []).each do |assoc|
        raise "You tried to set an element of #{assoc_name} on a #{self.class.name} to an instance of #{assoc.class.name}, but it needs to be a #{entity_dto_class.name}" if assoc && !assoc.is_a?(entity_dto_class)
      end
      instance_variable_set("@#{assoc_name}", assoc_array)
    end

    define_method assoc_name do
      instance_variable_get("@#{assoc_name}") || []
    end
  end

  def plain_field(*fields)
    fields.map { |f| add_defined_fields(__method__, f) }
    attr_accessor(*fields)
  end

  def plain_field_deprecated(old_field, new_field_attr, new_field_obj = nil)
    if new_field_obj.present?
      setter = ->(o, v) { new_field_obj.call(o).send("#{new_field_attr}=", v) }
      getter = ->(o) { new_field_obj.call(o).send(new_field_attr) }
    else
      setter = ->(o, v) { o.send("#{new_field_attr}=", v) }
      getter = ->(o) { o.send(new_field_attr) }
    end

    plain_field_redirect(old_field, setter, getter)
  end

  def plain_field_redirect(old_field, new_field_set, new_field_get)
    add_defined_fields(:plain_field, old_field)
    define_method "#{old_field}=" do |v|
      new_field_set.call(self, v)
    end
    define_method old_field do
      new_field_get.call(self)
    end
  end

  # Not really necessary, but for completeness...
  def plain_array_field(*fields)
    fields.map { |f| add_defined_fields(__method__, f) }
    attr_accessor(*fields)
  end

  def integer_field(*fields)
    fields.each do |f|
      add_defined_fields(__method__, f)
      define_method "#{f}=" do |v|
        if v.nil?
          instance_variable_set("@#{f}", nil)
        else
          instance_variable_set("@#{f}", v.to_i)
        end
      end
      define_method f do
        instance_variable_get("@#{f}")
      end
    end
  end

  def integer_array_field(*fields)
    fields.each do |f|
      add_defined_fields(__method__, f)
      define_method "#{f}=" do |v_array|
        if v_array.nil?
          instance_variable_set("@#{f}", nil)
        else
          instance_variable_set("@#{f}", v_array.compact.map(&:to_i))
        end
      end
      define_method f do
        instance_variable_get("@#{f}") || []
      end
    end
  end

  def timestamp_field(*fields)
    fields.each do |f|
      add_defined_fields(__method__, f)
      define_method "#{f}=" do |v|
        if v.nil?
          instance_variable_set("@#{f}", nil)
        else
          instance_variable_set("@#{f}", convert_to_datetime(v).to_f.round(5))
        end
      end
      define_method f do
        instance_variable_get("@#{f}")
      end
      define_method "#{f}_as_datetime" do
        v = instance_variable_get("@#{f}")
        v && Time.at(v)
      end
      define_method "#{f}_as_date" do
        v = instance_variable_get("@#{f}")
        v && Time.at(v).in_time_zone(FmDtos.time_zone).to_date
      end
    end
  end
  def timestamp_array_field(*fields)
    fields.each do |f|
      add_defined_fields(__method__, f)
      define_method "#{f}=" do |v_array|
        if v_array.nil?
          instance_variable_set("@#{f}", nil)
        else
          instance_variable_set("@#{f}", v_array.compact.map{|v| convert_to_datetime(v).to_f.round(5)})
        end
      end
      define_method f do
        instance_variable_get("@#{f}") || []
      end
      define_method "#{f}_as_datetime" do
        (instance_variable_get("@#{f}") || []).compact.map{|v| Time.at(v)}
      end
      define_method "#{f}_as_date" do
          (instance_variable_get("@#{f}") || []).compact.map{|v| Time.at(v).in_time_zone(FmDtos.time_zone).to_date}
      end
    end
  end

  def datetime_field(*fields)
    fields.each do |f|
      add_defined_fields(__method__, f)
      define_method "#{f}=" do |v|
        if v.nil?
          instance_variable_set("@#{f}", nil)
        else
          instance_variable_set("@#{f}", v.iso8601)
        end
      end
      define_method f do
        v = instance_variable_get("@#{f}")
        v && Time.parse(v)
      end
      define_method "#{f}_as_timestamp" do
        v = instance_variable_get("@#{f}")
        v && Time.parse(v).to_f.round(5)
      end
    end
  end

  def datetime_array_field(*fields)
    fields.each do |f|
      add_defined_fields(__method__, f)
      define_method "#{f}=" do |v_array|
        if v_array.nil?
          instance_variable_set("@#{f}", nil)
        else
          instance_variable_set("@#{f}", v_array.compact.map(&:iso8601))
        end
      end
      define_method f do
        (instance_variable_get("@#{f}") || []).map { |v| Time.parse(v) }
      end
      define_method "#{f}_as_timestamp" do
        (instance_variable_get("@#{f}") || []).map { |v| Time.parse(v).to_f.round(5) }
      end
    end
  end

  def date_field(*fields)
    fields.each do |f|
      add_defined_fields(__method__, f)
      define_method "#{f}=" do |v|
        if v.nil?
          instance_variable_set("@#{f}", nil)
        else
          instance_variable_set("@#{f}", v.to_date.iso8601)
        end
      end
      define_method f do
        v = instance_variable_get("@#{f}")
        v && Date.parse(v)
      end
    end
  end

  def date_array_field(*fields)
    fields.each do |f|
      add_defined_fields(__method__, f)
      define_method "#{f}=" do |v_array|
        if v_array.nil?
          instance_variable_set("@#{f}", nil)
        else
          instance_variable_set("@#{f}", v_array.compact.map { |v| v.to_date.iso8601 })
        end
      end
      define_method f do
        (instance_variable_get("@#{f}") || []).map { |v| Date.parse(v) }
      end
    end
  end

  def dollar_field(*fields)
    fields.each do |f|
      add_defined_fields(__method__, f)
      define_method "#{f}=" do |v|
        if v.nil?
          instance_variable_set("@#{f}", nil)
        else
          instance_variable_set("@#{f}", dollar_as_cents(v))
        end
      end
      define_method f do
        cents_as_dollar(instance_variable_get("@#{f}"))
      end
      define_method "#{f}_as_cents" do
        instance_variable_get("@#{f}")
      end
      define_method "#{f}_as_money" do
        # Here we should be able to reference the money class, since it won't be evaluated unless needed
        v = instance_variable_get("@#{f}")
        v && Money.new(v.to_i)
      end
    end
  end

  def dollar_array_field(*fields)
    fields.each do |f|
      add_defined_fields(__method__, f)
      define_method "#{f}=" do |v_array|
        if v_array.nil?
          instance_variable_set("@#{f}", nil)
        else
          instance_variable_set("@#{f}", v_array.compact.map { |v| dollar_as_cents(v) })
        end
      end
      define_method f do
        (instance_variable_get("@#{f}") || []).map { |v| cents_as_dollar(v) }
      end
      define_method "#{f}_as_cents" do
        instance_variable_get("@#{f}") || []
      end
      define_method "#{f}_as_money" do
        (instance_variable_get("@#{f}") || []).map { |v| Money.new(v.to_i) }
      end
    end
  end

  def decimal_field(*fields)
    fields.each do |f|
      add_defined_fields(__method__, f)
      define_method "#{f}=" do |v|
        if v.nil?
          instance_variable_set("@#{f}", nil)
        else
          instance_variable_set("@#{f}", v.to_f)
        end
      end
      define_method f do
        v = instance_variable_get("@#{f}")
        v && v.to_d
      end
    end
  end

  def decimal_array_field(*fields)
    fields.each do |f|
      add_defined_fields(__method__, f)
      define_method "#{f}=" do |v_array|
        if v_array.nil?
          instance_variable_set("@#{f}", nil)
        else
          instance_variable_set("@#{f}", v_array.compact.map(&:to_f))
        end
      end
      define_method f do
        (instance_variable_get("@#{f}") || []).map(&:to_d)
      end
    end
  end

  def boolean_field(*fields)
    fields.each do |f|
      add_defined_fields(__method__, f)
      define_method "#{f}=" do |v|
        if v.nil?
          instance_variable_set("@#{f}", nil)
        else
          instance_variable_set("@#{f}", !!v)
        end
      end
      define_method f do
        instance_variable_get("@#{f}")
      end
      define_method "#{f}?" do
        !!instance_variable_get("@#{f}")
      end
      if f.to_s.starts_with?('is_')
        define_method "#{f.to_s.sub('is_', '')}?" do
          !!instance_variable_get("@#{f}")
        end
      end
    end
  end

  def boolean_array_field(*fields)
    fields.each do |f|
      add_defined_fields(__method__, f)

      define_method "#{f}=" do |v_array|
        if v_array.nil?
          instance_variable_set("@#{f}", nil)
        else
          instance_variable_set("@#{f}", v_array.compact.map { |v| !!v })
        end
      end
      define_method f do
        (instance_variable_get("@#{f}") || []).map { |v| !!v }
      end
    end
  end

  def binary_field(*fields)
    fields.each do |f|
      add_defined_fields(__method__, f)

      define_method "#{f}=" do |v|
        if v.nil?
          instance_variable_set("@#{f}", nil)
        else
          instance_variable_set("@#{f}", Base64.encode64(v))
        end
      end
      define_method f do
        instance_variable_get("@#{f}")
      end
      define_method "#{f}_decoded" do
        v = instance_variable_get("@#{f}")
        v && Base64.decode64(v)
      end
    end
  end

  def json_field(*fields)
    fields.each do |f|
      add_defined_fields(__method__, f)

      define_method "#{f}=" do |v|
        if v.nil?
          instance_variable_set("@#{f}", {})
        elsif v.respond_to?(:to_hash) || v.is_a?(Hash)
          instance_variable_set("@#{f}", v)
        else
          instance_variable_set("@#{f}", JSON.parse(v))
        end
      end
      define_method f do
        instance_variable_get("@#{f}")
      end
    end
  end

  def defined_fields
    @defined_fields
  end

  def add_defined_fields(field_type, name, dto_class = nil)
    @defined_fields ||= []
    @defined_fields << [field_type, name, dto_class]
  end
end
