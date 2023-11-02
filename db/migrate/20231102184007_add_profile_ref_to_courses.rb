class AddProfileRefToCourses < ActiveRecord::Migration[7.0]
  def change 
    add_reference :courses, :profile , foreign_key: true
  end
end
