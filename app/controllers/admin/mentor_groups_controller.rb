class Admin::MentorGroupsController < AdminController 
  include Concerns::AdminCrud

  def show
    @mentors = User.roled_users('mentor')
  end

  def assign_mentors_to_group
    @mentor_group = MentorGroup.find(params[:mentors][:mentor_group_id])
    params[:mentor_ids].each do |id|
      user = User.find(id)
      unless user.mentor_group.present?
        user.update(mentor_group_id: @mentor_group.id)
      end
    end
    redirect_to admin_mentor_group_path(@mentor_group),
      flash: { success: 'Mentors are assigned successfully to this group' }
  end

  private

    def mentor_group_params
      params.require(:mentor_group).permit!
    end
end
