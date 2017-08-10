# Show the appropriate report.
get '/report' do
  erb :"accounts/report"
end

# Show the form for adding a new row.
get "/add_row_form" do
  erb :"accounts/add_row_form"
end

# Process the form that adds a new row to the CSV file.
post '/add_row' do
  params.to_s
  addToFile(convertInput)

  # Redirect to confirmation page?

  erb :index
end