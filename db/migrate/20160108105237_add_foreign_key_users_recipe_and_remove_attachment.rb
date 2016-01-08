class AddForeignKeyUsersRecipeAndRemoveAttachment < ActiveRecord::Migration
  def change
  	add_column :recipes, :user_id, :integer
    remove_column :recipes, :pic_file_name
  	remove_column :recipes, :pic_content_type
    remove_column :recipes, :pic_file_size
    remove_column :recipes, :pic_updated_at
    remove_column :ingredients, :attach_file_name
  	remove_column :ingredients, :attach_content_type
    remove_column :ingredients, :attach_file_size
    remove_column :ingredients, :attach_updated_at
  end
  add_foreign_key :recipes, :users
end
