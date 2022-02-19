class RemoveCreateAtFromCustomers < ActiveRecord::Migration[6.1]
  def change
    remove_column :customers, :create_at, :datetime
  end
end
