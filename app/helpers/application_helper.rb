module ApplicationHelper
  def flash_class(level)
    case level
      when :success then "alert alert-success"
      when :notice then "alert alert-success"
      when :alert then "alert alert-danger"
      when :error then "alert alert-error"
      when :warning then "alert alert-warning"
    end
  end

  def check_for_mentor_group(mentor, mentor_group)
    if mentor.mentor_group.present? && mentor.mentor_group == mentor_group
      true
    else
      false
    end
  end

end