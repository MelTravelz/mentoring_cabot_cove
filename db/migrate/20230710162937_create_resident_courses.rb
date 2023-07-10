class CreateResidentCourses < ActiveRecord::Migration[7.0]
  def change
    create_table :resident_courses do |t|
      t.references :resident, null: false, foreign_key: true
      t.references :course, null: false, foreign_key: true

      t.timestamps
    end
  end
end
