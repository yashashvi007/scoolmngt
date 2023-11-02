class CreateEnrollments < ActiveRecord::Migration[7.0]
  def change
    create_table :enrollments do |t|
      t.references :courses, null: false, foreign_key: true
      t.references :profiles, null: false, foreign_key: true
     
      t.timestamps
    end
  end
end
