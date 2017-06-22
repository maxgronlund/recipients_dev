class MessageRecipient < ApplicationRecord
  belongs_to :message_subject
  belongs_to :reciveable, polymorphic: true

  def title
    message_subject.title
  end

  def content
    if message_content = message_subject.message_contents.first
      return message_content.content
    end
  end
end
