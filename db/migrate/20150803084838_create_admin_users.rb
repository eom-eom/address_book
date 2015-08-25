class CreateAdminUsers < ActiveRecord::Migration

  def up
    create_table :admin_users do |t|

      t.string "username", :limit => 30
      t.string "password", :limit => 40

      t.timestamps null: false
    end
  end

  def down

   drop_table :admin_users

  end

end
