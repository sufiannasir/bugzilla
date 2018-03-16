Rails.application.routes.draw do

	get '/users/signup', to: 'users#signup', as: 'users_signup'
	post '/users/signup_process', to: 'users#signup_process', as: 'signup_process'

	get '/users/signin', to: 'users#signin', as: 'users_signin'
	post '/users/signin_process', to: 'users#signin_process', as: 'signin_process'

	root :to => "users#dashboard"

	get '/users/logout', to: 'users#logout', as: 'logout'

	get '/project/create', to: 'projects#create', as: 'project_create'
	post '/project/create_process', to: 'projects#create_process', as: 'project_create_process'

	get '/project/delete/:id', to: 'projects#delete', as: 'project_delete'

	get '/bugs/list/:id', to: 'bugs#list', as: 'bugs_list'


	get '/bugs/create/:id', to: 'bugs#create', as: 'create_bug'
	post '/bugs/create_process', to: 'bugs#create_process', as: 'bug_create_process'


	get '/project/userslist/:id', to: 'projects#userslist', as: 'project_userslist'
	  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
