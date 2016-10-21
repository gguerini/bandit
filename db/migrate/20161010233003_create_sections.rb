class CreateSections < ActiveRecord::Migration[5.0]
  def change
    create_table :sections do |t|
      t.references :race_report, foreign_key: true
      t.string :title, null: false
      t.text :description, null: false
      t.integer :order, null: false, default: 0

      t.timestamps
    end
  end
end
