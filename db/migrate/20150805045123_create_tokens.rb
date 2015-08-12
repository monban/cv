class CreateTokens < ActiveRecord::Migration
  def change
    create_table :tokens do |t|
      t.string :key
      t.datetime :expires_at
      t.string :name

      t.timestamps null: false
    end
    add_index :tokens, :key
  end
end
