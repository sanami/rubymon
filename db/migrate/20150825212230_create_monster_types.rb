class CreateMonsterTypes < ActiveRecord::Migration
  def change
    create_table :monster_types do |t|
      t.string :type_name
      t.integer :type_weakness

      t.timestamps null: false
    end

    add_index :monster_types, :type_name
    add_index :monster_types, :type_weakness
  end
end
