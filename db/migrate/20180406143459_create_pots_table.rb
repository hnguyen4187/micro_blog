class CreatePotsTable < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :title, :limit => 30
      t.text :content, :limit => 150
      t.timestamps
    end
  end
end
