require "sinatra"
require "csv"
require "pry"

 
get '/' do

		accounts = {}

		CSV.foreach("accounts.txt", {headers: true, return_headers: false}) do |row|
	  # Add a key for each account to the accounts Hash.
	  account = row["Account"].chomp

	  if !accounts[account]
	    accounts[account] = {
	      tally: 0.00,
	      categories: {
	      }
	    }
	  end

	  # Set the account which is being affected by this iteration.
	  current_account = accounts[account]
	  @account_name = account
	  # Clean up outflow and inflow.
	  outflow = row["Outflow"].gsub(/[,\$]/, "").to_f.round(2)
	  inflow = row["Inflow"].gsub(/[,\$]/, "").to_f.round(2)
	  transaction_amount = inflow - outflow

	  # Keep a tally for current balance of the account.
	  current_account[:tally] += transaction_amount
	  @current_balance = current_account[:tally]
	  category = row["Category"].chomp

	  # Initialize category.
	  if !current_account[:categories][category]
	    current_account[:categories][category] = {
	      tally: 0.00,
	      num_transactions: 0,
	      average_transaction_cost: 0.00
	    }
	  end

	  # Tally category.
	  current_account[:categories][category][:tally] += transaction_amount

	  # Increment transaction counter.
	  current_account[:categories][category][:num_transactions] += 1

	  # Update average transaction cost.
	  current_account[:categories][category][:average_transaction_cost] = current_account[:categories][category][:tally] / current_account[:categories][category][:num_transactions]  

	end
	@output = accounts

	erb :index
		
	#erb :index

end







