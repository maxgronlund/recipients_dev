class User < ApplicationRecord
  belongs_to :family
  #belongs_to :reciver, polymorphic: true

  has_many :messages, as: :reciveable, class_name: 'MessageRecipient'



  def oganization_name
    return "" unless family
    return "" unless family.organization
    family.organization.name
  end

  def organization
    return unless family
    return unless family.organization
    family.organization
  end
end
