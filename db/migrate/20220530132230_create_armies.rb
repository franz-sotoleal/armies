class CreateArmies < ActiveRecord::Migration[7.0]
  def change
    create_table :armies do |t|
      t.integer :coins
      t.string :type

      t.timestamps
    end
  end
end
