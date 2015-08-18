class AddAdminToToken < ActiveRecord::Migration
  def change
    add_column :tokens, :admin, :boolean, { default: false }
  end
end
