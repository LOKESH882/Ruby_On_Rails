class CreateEntries < ActiveRecord::Migration[8.1]
  def change
    create_table :entries do |t|
      t.decimal :amount
      t.string :category
      t.string :entry_type
      t.date :date

      t.timestamps
    end
  end
end
