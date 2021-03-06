class User < ActiveRecord::Base
  include Image
  has_many :recipes
  has_many :posts
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :lockable

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
