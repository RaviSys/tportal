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

  def program_list
    Program.all.map {|p| [p.name, p.id]}
  end 

  def mentor_group_list
    MentorGroup.all.map {|mentor_group| [mentor_group.name, mentor_group.id]}
  end

  def participant_list
    User.roled_users('participant').map { |p| [p.name, p.id] }
  end

  def tutor_list
    User.roled_users('tutor').map { |p| [p.name, p.id] }
  end

end
