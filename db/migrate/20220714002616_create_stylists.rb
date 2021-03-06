class CreateStylists < ActiveRecord::Migration[7.0]
  def change
    create_table :stylists do |t|
      t.string :dni, null: false, unique: true
      t.string :name
      t.string :telephone
      t.string :role
      t.boolean :actived, default: true
      t.references :business, null: false, foreign_key: true

      t.timestamps
    end
    add_index :stylists, :dni, unique: true
  end
end
