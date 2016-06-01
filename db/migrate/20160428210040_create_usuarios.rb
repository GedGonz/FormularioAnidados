class CreateUsuarios < ActiveRecord::Migration
  def change
    create_table :usuarios do |t|
      t.string :user
      t.string :pasword
      t.references :persona, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
