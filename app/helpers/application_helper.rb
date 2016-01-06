module ApplicationHelper
	def logout_user
		p params[:controller]
		if current_user
			link_to 'Logout', destroy_user_session_path, method: :delete
		elsif params[:action]=='new' && params[:controller]=='devise/registrations'
			link_to 'Login', new_user_session_path, method: :get
		else
			link_to 'Register',  new_user_registration_path, method: :get
		end
	end
end
