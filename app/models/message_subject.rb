class MessageSubject < ApplicationRecord
  belongs_to :messageble, polymorphic: true
  belongs_to :user
  belongs_to :organization
  has_many :message_contents
  has_many :message_recipients
  validates :title, :user, presence: true


  accepts_nested_attributes_for :message_contents
  accepts_nested_attributes_for :message_recipients
end
