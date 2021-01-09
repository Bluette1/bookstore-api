class AddFieldsToBook < ActiveRecord::Migration[6.1]
  def change
    add_column :books, :pagesRead, :integer, :default => 0
    add_column :books, :totalPages, :integer, :default => 100
    add_column :books, :currentChapter, :string, :default => 'Introduction'
  end
end
