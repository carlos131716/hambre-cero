class CreateReservas < ActiveRecord::Migration[8.0]
  def change
    create_table :reservas do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :plato_id
      t.integer :cantidad

      t.timestamps
    end
  end
end
