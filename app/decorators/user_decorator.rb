class UserDecorator < ApplicationDecorator
  delegate_all

  def created_at
    object.created_at.strftime("%a %m/%d/%y")
  end

  def name
    "#{object.first_name} #{object.last_name}".strip
  end

  def role
    object.role.capitalize
  end

end
