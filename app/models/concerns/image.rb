module Image
  extend ActiveSupport::Concern
  include ActionView::Helpers::TextHelper

  IMAGE_SIZE = %w(thumb small medium large)

  included do
    has_attachment :pic, accept: [:jpg, :png, :gif]
  end


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
end