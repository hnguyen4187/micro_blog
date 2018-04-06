class CreateUsersTable < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
          t.string :fname
          t.string :lname
          t.string :password
          t.string :email
          t.string :user_name
      end
  end
end
