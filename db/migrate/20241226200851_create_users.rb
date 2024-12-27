class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password_digest
      t.integer :role
      t.string :apellido_familia
      t.integer :numero_integrantes

      t.timestamps
    end
  end
end