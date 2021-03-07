class AddDetailsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :introduction, :text
    add_column :users, :book_id, :integer
  end
end
