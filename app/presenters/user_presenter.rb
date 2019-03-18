class UserPresenter 
  def initialize(user, view)
    @user = user
    @view = view
  end

  def name
    @user.name
  end

  def default_text
    "Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus."
  end

  def created_at
    "Created at: #{@user.created_at.strftime("%B %d, %Y %H:%M %p")}"
  end

  def role
    @user.role.capitalize
  end

end