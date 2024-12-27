class CreateMenus < ActiveRecord::Migration[8.0]
  def change
    create_table :menus do |t|
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end