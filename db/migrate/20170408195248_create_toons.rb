class CreateToons < ActiveRecord::Migration[5.0]
  def change
    create_table :toons do |t|
      t.string :name, null: false
      t.string :v_code
      t.integer :key_id
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
