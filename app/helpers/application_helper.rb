module ApplicationHelper
  def nav_link(link_text, link_path)
    class_name = current_page?(link_path) ? 'active' : ''

    content_tag(:li, :class => class_name) do
      link_to link_text, link_path
    end
  end

  def nav_badge
    @statu_code_items =current_user.stuffs.all(
        :group  => "statu_code",
        :select => 'statu_code ,COUNT(statu_code ) AS statu_num'
    )
  end

  def status_num_2_badge(status_nums, nav_type)
    status_nums.each do |s|
      return  s.statu_num  if s.statu_code == nav_type
    end
  end
end
