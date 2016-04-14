module TagsHelper
  def render_tags(taggable)
    taggable.tags.reduce([]) do |html, tag|
      html << content_tag(:span, tag.name, class: "label label-#{shuffle_color}")
    end.join(" ")
  end

  private

  def shuffle_color
    %w(default primary success info warning danger).sample
  end
end
