class AddFieldsToBook < ActiveRecord::Migration[6.1]
  def change
    add_column :books, :totalPages, :integer, :default => 100
  end
end
