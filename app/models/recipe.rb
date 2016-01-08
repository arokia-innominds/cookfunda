class Recipe < ActiveRecord::Base
  include Image
  
  belongs_to :user

  rails_admin do
    edit do
      include_all_fields
       exclude_fields :pic_content_type, :pic_file_name, :pic_file_size, :pic_updated_at

      field :pic do
        label 'Image'
        partial 'image_upload'
      end
    end

    show do
      include_all_fields
      exclude_fields :pic_content_type, :pic_file_name, :pic_file_size, :pic_updated_at

      field :pic do
        label 'Image'
        pretty_value do
          bindings[:object].icon_preview(bindings[:view], Image::IMAGE_SIZE)
        end
      end
    end
  end

end
