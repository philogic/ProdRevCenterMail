class AddUniqueIndexToClient < ActiveRecord::Migration[5.0]
  def change
    add_index :clients, :name, unique: true
  end
end
