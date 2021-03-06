class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :provider, null: false
      t.string :uid, null: false
      t.string :name
      t.string :email
      t.string :url
      t.string :college
      t.string :username

      t.timestamps
    end    
      add_index :users, :provider
      add_index :users, :uid
      add_index :users, [:provider, :uid], unique: true
  end
end
