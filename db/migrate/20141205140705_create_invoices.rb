class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.string :name
      t.integer :amount
      t.date :invoice_date

      t.timestamps
    end
  end
end
