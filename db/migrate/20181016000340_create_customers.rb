class CreateCustomers < ActiveRecord::Migration[5.1]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :email
      t.integer :phone_number, :integer, limit: 8

      t.timestamps
    end
  end
end
