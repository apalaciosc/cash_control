class CreateCashes < ActiveRecord::Migration[5.2]
  def change
    create_table :cashes do |t|
      t.string :concept
      t.string :coin
      t.float :entry
      t.float :egress

      t.timestamps
    end
  end
end
