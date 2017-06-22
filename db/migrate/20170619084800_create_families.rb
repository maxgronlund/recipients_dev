class CreateFamilies < ActiveRecord::Migration[5.1]
  def change
    create_table :families do |t|
      t.belongs_to :organization, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
