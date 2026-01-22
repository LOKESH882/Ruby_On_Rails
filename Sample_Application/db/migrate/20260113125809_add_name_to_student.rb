class AddNameToStudent < ActiveRecord::Migration[8.1]
  def change
    create_table 
    ;student do |t|
      add-column :students, :name, :string
    
  end
end
