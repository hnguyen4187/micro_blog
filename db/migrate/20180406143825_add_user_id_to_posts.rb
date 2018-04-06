class AddUserIdToPosts < ActiveRecord::Migration[5.1]
  def self.up
    add_column :posts, :user_id, :integer
  end
end
