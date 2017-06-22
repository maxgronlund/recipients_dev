class MessageContent < ApplicationRecord
  belongs_to :message_subject
  belongs_to :user
  has_attached_file :attachment
  validates :content, presence: true
end
