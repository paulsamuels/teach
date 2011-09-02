class CreateTopics < ActiveRecord::Migration
  def self.up
    create_table :topics do |t|
      t.string :title
      t.text :body
      t.string :summary
      t.integer :display_options, :default => Topic::ACTIVE | Topic::LINKABLE

      t.timestamps
    end
  end

  def self.down
    drop_table :topics
  end
end
