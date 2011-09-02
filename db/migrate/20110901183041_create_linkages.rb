class CreateLinkages < ActiveRecord::Migration
  def self.up
    create_table :linkages do |t|
      t.integer :topic_id
      t.integer :child_id
      t.boolean :active, :default => true

      t.timestamps
    end
  end

  def self.down
    drop_table :linkages
  end
end
