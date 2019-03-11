class AddMentorGroupIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :mentor_group_id, :integer
  end
end
