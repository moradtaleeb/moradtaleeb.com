class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :title
      t.text :summary
      t.text :content
      t.integer :category_id

      t.timestamps
    end
  end
end
