class CreateTableEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :calendars do |t|
      t.string :event_name
      t.datetime :start_at
      t.datetime :end_at

      t.timestamps
    end
  end
end
