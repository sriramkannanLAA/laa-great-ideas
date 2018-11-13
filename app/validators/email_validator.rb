class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)*justice\.gov\.uk)\z/i
      record.errors[attribute] << (options[:message] || "must end in justice.gov.uk")
    end
  end
end
