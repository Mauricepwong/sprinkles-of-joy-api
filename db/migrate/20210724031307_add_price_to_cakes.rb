class AddPriceToCakes < ActiveRecord::Migration[6.1]
  def change
    add_column :cakes, :price, :decimal, :precision => 8, :scale => 2
  end
end
