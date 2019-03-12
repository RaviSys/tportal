class CreateTutorPrograms < ActiveRecord::Migration[5.2]
  def change
    create_table :tutor_programs do |t|
      t.integer :tutor_id
      t.integer :program_id

      t.timestamps
    end
  end
end
