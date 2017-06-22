class Family < ApplicationRecord
  belongs_to :organization
  has_many :users
  has_many :messages, as: :messageble, class_name: 'MessageSubject'

  def organization_name
    return "" unless organization
    organization.name
  end
end
