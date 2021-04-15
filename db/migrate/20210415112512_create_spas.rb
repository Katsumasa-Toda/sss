class CreateSpas < ActiveRecord::Migration[5.2]
  def change
    create_table :spas do |t|
      t.integer :user_id
      t.string :name
      t.text :address
      t.text :introduction
      t.integer :bath
      t.integer :parking
      t.integer :opening

      t.timestamps
    end
  end
end
