class Inquiry < ActiveRecord::Base
  def initialize(attributes = nil, options = {})
    super underscore_keys(attributes), options
  end

  def attributes=(new_attributes,guard_protected_attributes=nil)
    super underscore_keys(new_attributes)
  end

  private

  def underscore_keys(hash)
    Hash[hash.map { |k,v| [k.to_s.underscore.to_sym,v] }]
  end
end
