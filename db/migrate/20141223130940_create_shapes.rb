class CreateShapes < ActiveRecord::Migration
  def change
    create_table :shapes do |t|
      t.string :title
      t.string :tutorial_url
      t.timestamps
    end
  end
end
