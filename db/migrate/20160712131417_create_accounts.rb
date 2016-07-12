class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :display_name
      t.string :login_code
      t.string :group

      t.timestamps
    end
  end
end
