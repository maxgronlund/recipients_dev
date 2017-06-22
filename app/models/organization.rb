class Organization < ApplicationRecord

  has_many :families
  has_many :message_subjects

  def users
    User.where(family_id: family_ids)
  end

end
