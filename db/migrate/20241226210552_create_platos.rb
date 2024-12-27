class CreatePlatos < ActiveRecord::Migration[8.0]
  def change
    create_table :platos do |t|
      t.string :name_comida

      t.timestamps
    end
  end
end
