class CreateAuthentications < ActiveRecord::Migration
  def change
    create_table :authentications do |t|
      t.references :user, index: true
      t.string :provider
      t.string :uid
      t.text :auth_info

      t.timestamps null: false
    end

    add_index :authentications, [:provider, :uid]
    add_index :authentications, :provider
  end
end
