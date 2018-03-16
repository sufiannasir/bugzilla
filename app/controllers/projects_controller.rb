class ProjectsController < ApplicationController
	def create
		if session[:id].present?  && session[:role]== "manager" then
			@project= Project.new
		else
			redirect_to users_signin_path
		end
	end

	def create_process

		if session[:id].present? && session[:role]== "manager" then
			req=params
			project = Project.new()
			project.title=req["title"]
			project.description=req["description"]

			if project.save then
				req["developers"].each do |developer_id|
					ProjectUser.create(:user_id=> developer_id,:project_id =>project.id)
				end
				req["qa"].each do |qa_id|
					ProjectUser.create(:user_id=> qa_id,:project_id =>project.id)
				end

				ProjectUser.create(:user_id=> session[:id],:project_id =>project.id)
				redirect_to users_signin_path
			else
				flash[:error]= 'Error while processing ! please try again later.'
				redirect_to root_path
			end
		else
			redirect_to users_signin_path
		end

	end

	def userslist
		if session[:id].present?  && session[:role]== "manager" then
			@users=User.joins(:project_users).where(:project_users=> {project_id: params[:id]})
		else
			redirect_to root_path
		end
	end

	def update
	end

	def delete
		if session[:id].present?  && session[:role]== "manager" then
			user=ProjectUser.where(:user_id => session[:id], :project_id => params[:id])
			if user.present? then
				Project.destroy(params[:id])
			end
			redirect_to root_path
		else
			redirect_to users_signin_path
		end
	end
end
