class CreateSpaComments < ActiveRecord::Migration[5.2]
  def change
    create_table :spa_comments do |t|
      t.integer :user_id
      t.integer :spa_id
      t.text :comment

      t.timestamps
    end
  end
end
