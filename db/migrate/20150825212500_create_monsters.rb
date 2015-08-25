class CreateMonsters < ActiveRecord::Migration
  def change
    create_table :monsters do |t|
      t.references :user, index: true, foreign_key: true
      t.references :team, index: true, foreign_key: true
      t.references :monster_type, index: true, foreign_key: true

      t.string :monster_name
      t.integer :monster_power

      t.timestamps null: false
    end

    add_index :monsters, :monster_name
    add_index :monsters, :monster_power
  end
end
