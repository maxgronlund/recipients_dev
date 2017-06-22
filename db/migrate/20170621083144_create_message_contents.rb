class CreateMessageContents < ActiveRecord::Migration[5.1]
  def change
    create_table :message_contents do |t|
      t.belongs_to :message_subject, foreign_key: true
      t.belongs_to :user, foreign_key: true
      t.text :content

      t.timestamps
    end
  end
end
