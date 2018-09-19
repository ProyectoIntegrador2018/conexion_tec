class SorceryCore < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email,            :null => false
      t.string :crypted_password
      t.string :salt
      t.string :role,        	  :null => false
      t.string :name
      t.timestamps                :null => false
    end

    add_index :users, :email, unique: true

    # Add user_id as foreign key in judges and providers
    add_reference :judges, :user, index: true
    add_reference :projects, :user, index: true
  end
end
