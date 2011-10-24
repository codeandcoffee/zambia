class Inquiry < ActiveRecord::Base
  attr_accessor :full_inquiry_text

  def initialize(attributes = nil, options = {})
    super(underscore_keys(attributes), options)
  end

  def update_attributes(attributes = nil)
    super(underscore_keys(attributes))
  end

  def attributes=(new_attributes, guard_protected_attributes=nil)
    super(underscore_keys(new_attributes, guard_protected_attributes))
  end

  def serializable_hash(options = nil)
    Hash[super(options).map { |k,v| [k.to_s.camelize.uncapitalize,v] }]
  end

  private

  def underscore_keys(hash)
    Hash[hash.map { |k,v| [k.to_s.underscore.to_sym,v] }]
  end
end
