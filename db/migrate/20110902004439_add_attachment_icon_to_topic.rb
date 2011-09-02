class AddAttachmentIconToTopic < ActiveRecord::Migration
  def self.up
    add_column :topics, :icon_file_name, :string
    add_column :topics, :icon_content_type, :string
    add_column :topics, :icon_file_size, :integer
    add_column :topics, :icon_updated_at, :datetime
  end

  def self.down
    remove_column :topics, :icon_file_name
    remove_column :topics, :icon_content_type
    remove_column :topics, :icon_file_size
    remove_column :topics, :icon_updated_at
  end
end
