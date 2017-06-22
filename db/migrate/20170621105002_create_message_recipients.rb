class CreateMessageRecipients < ActiveRecord::Migration[5.1]
  def change
    create_table :message_recipients do |t|
      t.belongs_to :message_subject, foreign_key: true
      t.references :reciveable, polymorphic: true
      t.boolean :read
      t.boolean :send_email
      t.boolean :post_on_site
      t.boolean :send_to_e_boks

      t.timestamps
    end
  end
end
