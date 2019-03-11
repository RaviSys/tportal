class AddMentorIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :mentor_id, :integer
  end
end
