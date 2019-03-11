class CreateMentorGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :mentor_groups do |t|
      t.string :name

      t.timestamps
    end
  end
end
