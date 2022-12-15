module HashableDto
  def self.included(base)
    base.extend ::DtoAccessors
  end

  def to_hash
    initial_hash = {
      'dto_version' => self.class.dto_version,
      'dto_class' => self.class.name
    }
    instance_variables.each_with_object(initial_hash) do |var,hash|
      key = var.to_s.delete("@")
      value = instance_variable_get(var)
      value_to_populate = hashable_value(value)
      hash[key] = value_to_populate unless value_to_populate.nil?
    end
  end

  def hashable_value(value)
    case value
    when HashableDto
      value.to_hash
    when Array
      value.map{|v| hashable_value(v)}
    else
      value
    end
  end

  def upcase(val)
    val && val.to_s.upcase
  end

  def from_hash(hash)
    hash.each do |key, value_to_populate|
      var = "@#{key}".to_sym
      value = dehash_value(key, value_to_populate)
      instance_variable_set(var, value)
    end
    self
  end

  def dehash_value(key, value)
    object_builder_method = "build_#{key}_dto"
    array_object_builder_method = "build_array_#{key}_dto"
    if respond_to?(object_builder_method)
      send(object_builder_method).tap{|ref_obj| ref_obj.from_hash(value)}
    elsif respond_to?(array_object_builder_method)
      (value || []).map{|hash_value| send(array_object_builder_method).tap{|ref_obj| ref_obj.from_hash(hash_value)}}
    else
      value
    end
  end

  def dollar_as_cents(v)
    if v.class.name == 'Money' # We don't rely on the "Money" class existing, so can't use is_a? or instance_of?
      v.cents
    else
      (v.to_f * 100).round.to_i
    end
  end

  def cents_as_dollar(v)
    if v
      v.to_d / 100.to_d
    end
  end

  def convert_to_datetime(date_or_time)
    if date_or_time.respond_to?(:to_f)
      date_or_time
    elsif date_or_time.respond_to?(:year) && date_or_time.respond_to?(:month) && date_or_time.respond_to?(:day)
      local_date_as_utc_time(date_or_time)
    end
  end

  def local_date_as_utc_time(date)
    if date.respond_to?(:year)
      old_zone = Time.zone
      Time.zone = FmDtos.time_zone
      time = Time.zone.local(date.year, date.month, date.day).utc
      Time.zone = old_zone
      time
    else
      date
    end
  end

end
