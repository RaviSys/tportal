class CreateLectures < ActiveRecord::Migration[5.2]
  def change
    create_table :lectures do |t|
      t.string :title
      t.datetime :begin_time
      t.datetime :end_time
      t.references :program, foreign_key: true

      t.timestamps
    end
  end
end
