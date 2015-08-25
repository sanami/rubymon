class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.references :user, index: true, foreign_key: true
      t.string :team_name

      t.timestamps null: false
    end

    add_index :teams, :team_name
  end
end
