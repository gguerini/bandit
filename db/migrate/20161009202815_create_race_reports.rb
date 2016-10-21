class CreateRaceReports < ActiveRecord::Migration[5.0]
  def change
    create_table :race_reports do |t|
      t.belongs_to :user, null: false, foreign_key: true, index: true
      t.string :name, null: false
      t.string :distance, null: false, default: ""
      t.string :location, null: false, default: ""
      t.string :website, null: false, default: ""
      t.jsonb :goals, null: false, default: {}
      t.integer :status, null: false
      t.date :race_date, null: false

      t.timestamps
    end
  end
end
