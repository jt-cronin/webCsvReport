# Show the form into which they enter their login credentials.
get '/login' do
  erb :"login/login_form"
end

# Process the form that they submitted.
post '/login' do
  username = params["loginID"]
  password = params["passwordInput"]

  # Process the login info
  # If successful, set the session var
  # and redirect back to the homepage.
end

post '/logout' do
  # Log the user out. (But how?!)
end

