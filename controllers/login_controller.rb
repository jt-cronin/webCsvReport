# Show the form into which they enter their login credentials.
enable :sessions

get '/login' do
  erb :"login/login_form"
end

# Process the form that they submitted.
post '/login' do
  @username = params["loginID"]
  @password = params["passwordInput"]

  # Process the login info
  	if 
  	@username == 'admin' && @password == 'admin'
  	# If successful, set the session var
  	session[:id] = @username
  # and redirect back to the homepage.
  	redirect '/admin'
	else
	redirect '/login'
	end
end

post '/logout' do
  # Log the user out. (But how?!)
end

