class AddRegisterToCashes < ActiveRecord::Migration[5.2]
  def change
    add_column :cashes, :register, :string
  end
end
