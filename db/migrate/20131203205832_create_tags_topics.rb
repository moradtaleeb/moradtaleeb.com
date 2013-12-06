class CreateTagsTopics < ActiveRecord::Migration
  def change
    create_table :tags_topics do |t|
      t.references :tag
      t.references :topic
    end
    add_index :tags_topics, [:tag_id, :topic_id], :name => 'idx_tags_topics'
  end
end