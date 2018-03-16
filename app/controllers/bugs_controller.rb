class BugsController < ApplicationController
  def list
  	# puts params[:id]
  	@bugs=Bug.joins(:project).where(:projects=> {id: params[:id]})
  	# puts @bugs
  end

  def create
    if session[:id].present? then
      project_users=ProjectUser.where(:project_id => params[:id])
      if project_users.present? then

        @users= []
        project_users.each do |project_user|
          @users.push(project_user.user)
        end
      end

    else
      redirect_to users_signin_path
    end
  end

  def create_process
    if session[:id].present? then
      bug= Bug.new
      bug.project_id=params[:project][:id]
      bug.description=params[:description]
      bug.title=params[:title]
      bug.bug_type=params[:bug_type]
      if bug.bug_type=="feature" then
        bug.status=params[:feature_status]
      else
        bug.status=params[:bug_status]
      end
      bug.createdby_id=session[:id];
      bug.assignedto_id=params[:assignto];
      bug.screenshot=params[:screenshot]
      bug.deadline=params[:bug][:deadline]
      if bug.save then
        redirect_to users_signin_path
      else
        @body =bug
      end
    else
      redirect_to users_signin_path
    end
  end

  def delete
  end

  def update
  end
end
