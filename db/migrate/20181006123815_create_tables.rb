class CreateTables < ActiveRecord::Migration[5.1]
  def change
    create_table :tables do |t|
      t.boolean :status
      t.integer :limit

      t.timestamps
    end
  end
end
