class CreatePatrons < ActiveRecord::Migration[5.0]
  def change
    create_table :patrons do |t|
      t.references :user, foreign_key: true
      t.references :event, foreign_key: true

      t.timestamps
    end
  end
end
