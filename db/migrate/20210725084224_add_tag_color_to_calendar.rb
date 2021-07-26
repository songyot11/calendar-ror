class AddTagColorToCalendar < ActiveRecord::Migration[6.1]
  def change
    add_column :calendars, :tag_color, :string
  end
end
