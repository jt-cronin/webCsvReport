# Show the form into which they enter their new account information.
get '/new_user' do
  erb :"login/new_user_form"
end

# Process the form that they submitted.
post '/new_user' do
  addNewUser(params["newUserID"], params["newUserPassword"])
  session[:id] = params["newUserID"]
  redirect "/"
  # Process the account info
  # If successful, set the session var
  # and redirect back to the homepage.
end
