class RemoveCreateAtFromAdmins < ActiveRecord::Migration[6.1]
  def change
    remove_column :admins, :create_at, :datetime
  end
end
