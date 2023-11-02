class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :email
      t.string :role

      t.timestamps
    end
  end
end
