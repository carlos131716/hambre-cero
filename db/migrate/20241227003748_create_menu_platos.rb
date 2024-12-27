class CreateMenuPlatos < ActiveRecord::Migration[8.0]
  def change
    create_table :menu_platos do |t|
      t.references :menu, null: false, foreign_key: true
      t.references :plato, null: false, foreign_key: true
      t.integer :cantidad

      t.timestamps
    end
  end
end
