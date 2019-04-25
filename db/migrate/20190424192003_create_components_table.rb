class CreateComponentsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :components do |t|
      t.string :name
      t.string :description
      t.integer :category_id
      t.integer :device_id
    end
  end
end
