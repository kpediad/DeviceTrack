class CreateDevicesTable < ActiveRecord::Migration[5.2]
  def change
    create_table :devices do |t|
      t.string :name
      t.string :description
      t.integer :type_id
    end
  end
end
