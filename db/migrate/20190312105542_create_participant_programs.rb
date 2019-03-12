class CreateParticipantPrograms < ActiveRecord::Migration[5.2]
  def change
    create_table :participant_programs do |t|
      t.integer :participant_id
      t.integer :program_id

      t.timestamps
    end
  end
end
