class CreateInfoAds < ActiveRecord::Migration

  def up
    create_table :info_ads do |t|
      t.string "first_name", :limit => 25
      t.string "last_name", :limit => 50
      t.string "email", :default => ""
      t.string "street", :limit => 100
      t.string "city"
      t.string "state"
      t.integer "zip_code"

      t.timestamps null: false
    end
  end

def down
  drop_table :info_ads
end

end
