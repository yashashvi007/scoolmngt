class AddPasswordToProfile < ActiveRecord::Migration[7.0]
  def change
    add_column :profiles, :password, :string
  end
end
