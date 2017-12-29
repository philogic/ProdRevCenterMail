class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.string :originator
      t.string :recipient
      t.string :content
      t.integer :status

      t.timestamps
    end
  end
end
