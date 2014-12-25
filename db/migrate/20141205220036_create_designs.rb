class CreateDesigns < ActiveRecord::Migration
  def change
    create_table :designs do |t|
      t.string :title
      t.float :price
      t.text :description
      t.integer :shape_id
      t.integer :user_id

      t.timestamps
    end
  end
end
