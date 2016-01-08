class Ingredient < ActiveRecord::Base
  has_attachment :pic, accept: [:jpg, :png, :gif]

  IMAGE_SIZE = %w(thumb small medium large)


  def icon_preview(view, transformations)
    if pic
      rows = transformations.map do |t|
        "<tr><td>#{t}</td><td>#{view.cl_image_tag(pic.path, sign_url: true, transformation: t)}</td></tr>"
      end.join
      "<table>#{rows}</table>".html_safe
    else
      nil
    end
  end

  rails_admin do
    edit do
      include_all_fields
       exclude_fields :attach_content_type, :attach_file_name, :attach_file_size, :attach_updated_at

      field :pic do
        label 'Image'
        partial 'image_upload'
      end
    end

    show do
      include_all_fields
      exclude_fields :attach_content_type, :attach_file_name, :attach_file_size, :attach_updated_at

      field :pic do
        label 'Image'
        pretty_value do
          bindings[:object].icon_preview(bindings[:view], IMAGE_SIZE)
        end
      end
    end

  end
end
