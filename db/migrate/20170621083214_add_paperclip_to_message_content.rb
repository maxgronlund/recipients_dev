class AddPaperclipToMessageContent < ActiveRecord::Migration[5.1]
  def up
      add_attachment :message_contents, :attachment
    end

    def down
      remove_attachment :message_contents, :attachment
    end
end
