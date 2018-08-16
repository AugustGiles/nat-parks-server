class CreateParkStates < ActiveRecord::Migration[5.2]
  def change
    create_table :park_states do |t|
      t.integer :park_id
      t.integer :state_id

      t.timestamps
    end
  end
end
