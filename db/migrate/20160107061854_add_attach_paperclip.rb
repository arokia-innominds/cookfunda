class AddAttachPaperclip < ActiveRecord::Migration
  def change
  	add_column :ingredients, :attach_file_name,    :string
    add_column :ingredients, :attach_content_type, :string
    add_column :ingredients, :attach_file_size,    :integer
    add_column :ingredients, :attach_updated_at,   :datetime
  end
end
