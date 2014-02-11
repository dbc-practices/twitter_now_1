class CreateTables < ActiveRecord::Migration
  def change
    create_table :twitter_users do |t|
      t.string :username

      t.timestamps
    end

    create_table :tweets do |t|
      t.string :text
      t.belongs_to :twitter_user

      t.timestamps
    end
  end
end
