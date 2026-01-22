class CreateInfos < ActiveRecord::Migration[8.1]
  def change
    create_table :infos do |t|
      t.string :name
      t.integer :age
      t.string :city

      t.timestamps
    end
  end
end
