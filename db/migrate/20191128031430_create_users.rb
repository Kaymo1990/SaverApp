class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.decimal :start_time, :precision => 4, :scale => 2
      t.decimal :end_time, :precision => 4, :scale => 2
      t.decimal :salary

      t.timestamps
    end
  end
end
 