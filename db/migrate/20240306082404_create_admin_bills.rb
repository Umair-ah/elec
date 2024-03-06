class CreateAdminBills < ActiveRecord::Migration[7.0]
  def change
    create_table :admin_bills do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.date :bill_date
      t.decimal :amount
      t.boolean :paid, default: 0

      t.timestamps
    end
  end
end
