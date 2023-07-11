class CreateGoals < ActiveRecord::Migration[7.0]
  def change
    create_table :goals do |t|
      t.references :match, null: false, foreign_key: true
      t.string :player_name
      t.integer :minute

      t.timestamps
    end
  end
end
