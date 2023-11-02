class AddRolesToAdmin < ActiveRecord::Migration[7.0]
  def change
    add_column :admins, :role, :string, :default => "user"
  end
end
