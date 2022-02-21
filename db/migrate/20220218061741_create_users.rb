class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :username
      t.date :dob
      t.string :gender
      t.string :email
      t.string :password
      t.string :role

      t.timestamps
    end
  end
end
