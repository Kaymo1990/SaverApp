class CreateSalaryhours < ActiveRecord::Migration[6.0]
  def change
    create_table :salaryhours do |t|
      t.float :hours
      t.float :money
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :salaryhours, [:user_id, :created_at]
  end
end
