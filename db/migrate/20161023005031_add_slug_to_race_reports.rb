class AddSlugToRaceReports < ActiveRecord::Migration[5.0]
  def change
    add_column :race_reports, :slug, :string, nil: false
    add_index :race_reports, :slug, unique: true
  end
end
