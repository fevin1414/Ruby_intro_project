class CreateMatches < ActiveRecord::Migration[7.0]
  def change
    create_table :matches do |t|
      t.date :date
      t.string :home_team
      t.string :away_team
      t.string :stadium

      t.timestamps
    end
  end
end
