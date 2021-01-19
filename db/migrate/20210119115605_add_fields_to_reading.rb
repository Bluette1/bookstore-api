class AddFieldsToReading < ActiveRecord::Migration[6.1]
  def change
    add_column :readings, :pagesRead, :integer, :default => 0
    add_column :readings, :currentChapter, :string, :default => 100
  end
end
