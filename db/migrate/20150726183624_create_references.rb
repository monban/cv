class CreateReferences < ActiveRecord::Migration
  def change
    create_table :references do |t|
      t.string :name
      t.string :telephone
      t.string :email
      t.string :relationship
      t.text :endorsement

      t.timestamps null: false
    end
  end
end
