class CreatePratos < ActiveRecord::Migration[6.1]
  def change
    create_table :pratos do |t|
      t.string :nome, :limit => 80
      
      t.timestamps
    end
  end
end
