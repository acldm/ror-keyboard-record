class CreateRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :records do |t|
      t.string :total
      t.string :p2p
      t.string :p2r
      t.string :r2p
      t.string :r2r

      t.timestamps
    end
  end
end
