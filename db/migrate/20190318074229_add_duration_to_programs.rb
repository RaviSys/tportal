class AddDurationToPrograms < ActiveRecord::Migration[5.2]
  def change
    add_column :programs, :to_be_start_from, :date
    add_column :programs, :to_be_end_upto, :date
  end
end
