class CreateSites < ActiveRecord::Migration[5.0]
  def change
    create_table :sites do |t|
      t.string :url
      t.references :user, foreign_key: true
      t.hstore :analytics, null: false, default: {}

      t.timestamps
    end
  end
end
