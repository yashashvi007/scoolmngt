class CreateCourses < ActiveRecord::Migration[7.0]
  def change
    create_table :courses do |t|
      t.string :title
      t.text :description
      t.integer :fees

      t.timestamps
    end
  end
end
