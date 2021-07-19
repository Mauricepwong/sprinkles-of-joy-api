class CreateEnquiries < ActiveRecord::Migration[6.1]
  def change
    create_table :enquiries do |t|
      t.string :name
      t.string :contact
      t.reference :topic
      t.body :message

      t.timestamps
    end
  end
end
