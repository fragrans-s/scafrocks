class CreateScafrocks < ActiveRecord::Migration[5.0]
  def change
    create_table :scafrocks do |t|
      t.string :name_a
      t.decimal :hand_a
      t.string :name_b
      t.decimal :hand_b

      t.timestamps
    end
  end
end
