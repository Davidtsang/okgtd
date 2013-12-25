module ApplicationHelper
  def nav_link(link_text, link_path)
    class_name = current_page?(link_path) ? 'active' : ''

    content_tag(:li, :class => class_name) do
      link_to link_text, link_path
    end
  end

  def nav_badge
    if signed_in?
        Stuff.groups(current_user)
    end
  end

  def status_num_2_badge(status_nums, nav_type)

    result = nil
    status_nums.each do |s|
      if s.statu_code == nav_type

        result= "<span class=\"badge badge-red pull-right\">#{s.statu_num.to_s}</span>".html_safe
      end
    end
    result
  end

end #end mouldel
