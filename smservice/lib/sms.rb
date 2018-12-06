class SMS
  attr_reader :phone

  def self.configure(texts:, **args)
    const_set('TEXTS', texts)
  end

  def initialize(type:, phone:, **attrs)
    @type = type

    @phone = phone

    @attrs = attrs
  end

  def to_s
    TEXTS[@type] % @attrs
  end
end