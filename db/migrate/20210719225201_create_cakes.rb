class CreateCakes < ActiveRecord::Migration[6.1]
  def change
    create_table :cakes do |t|
      t.string :name
      t.text :description
      t.text :ingredients

      t.timestamps
    end
  end
end
