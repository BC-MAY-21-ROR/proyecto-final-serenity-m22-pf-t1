class AddStatusToInvoices < ActiveRecord::Migration[7.0]
  def change
    add_column :invoices, :status, :string, default: "pending"
  end
end
