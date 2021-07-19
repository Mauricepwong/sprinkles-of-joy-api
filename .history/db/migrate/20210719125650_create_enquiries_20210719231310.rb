class CreateEnquiries < ActiveRecord::Migration[6.1]
  def change
    create_table :enquiries do |t|
      t.string :name
      t.string :contact
      t.references :topic, null:false, foreign_key: true 
      t.body :message

      t.timestamps
    end
  end
end
