class CreateDesignImage < ActiveRecord::Migration
  def change
    create_table :design_images do |t|
      t.string :file
      t.integer :design_id
    end
  end
end
