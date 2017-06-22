class CreateMessageSubjects < ActiveRecord::Migration[5.1]
  def change
    create_table :message_subjects do |t|
      t.string :title
      t.references :messageble, polymorphic: true
      t.belongs_to :user, foreign_key: true
      t.belongs_to :organization, foreign_key: true

      t.timestamps
    end
  end
end
