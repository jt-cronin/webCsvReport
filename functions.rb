
def showReport

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
	  # Clean up outflow and inflow.
	  outflow = row["Outflow"].gsub(/[,\$]/, "").to_f.round(2)
	  inflow = row["Inflow"].gsub(/[,\$]/, "").to_f.round(2)
	  transaction_amount = inflow - outflow

	  # Keep a tally for current balance of the account.
	  current_account[:tally] += transaction_amount
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
	

	return accounts

end



def showSpecific (key)
	accounts = {}
	CSV.foreach("accounts.txt", {headers: true, return_headers: false}) do |row|
		  # Add a key for each account to the accounts Hash.
	
	 account = row["Account"].chomp
	 if account == key

		  if !accounts[account]
		    accounts[account] = {
		      tally: 0.00,
		      categories: {
		      }
		    }
		  end

		  # Set the account which is being affected by this iteration.
		  current_account = accounts[account]
		  # Clean up outflow and inflow.
		  outflow = row["Outflow"].gsub(/[,\$]/, "").to_f.round(2)
		  inflow = row["Inflow"].gsub(/[,\$]/, "").to_f.round(2)
		  transaction_amount = inflow - outflow

		  # Keep a tally for current balance of the account.
		  current_account[:tally] += transaction_amount
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
	end
		binding.pry
		return accounts

end


def printAccount (accountInfo)  
	html = ""
	accountInfo.each do |name, info| 
		html += "<h1>Account: " + name + "... Balance: $" + info[:tally].round(2).to_s + "</h1><table><tr><th> Category </th><th> Total Spent </th><th> Average Transaction</th></tr>"
        info[:categories].each do |category, c_info| 
        	html += "<tr><td>" + category + "</td><td>$" + c_info[:tally].round(2).to_s + "</td><td> $" + c_info[:average_transaction_cost].round(2).to_s + "</td></tr>"
        end 
        html += "</table>"
    end 
    return html
end 


def convertInput(userInput)
#Account,Date,Payee,Category,Outflow,Inflow

	newline = "#{userInput[:Account].chomp},#{userInput[:Date].chomp},#{userInput[:Payee].chomp},#{userInput[:Category].chomp},$#{userInput[:Outflow]},$#{userInput[:Inflow]}"
	return newline.chomp
end

def addToFile (input)
	File.open("accounts.txt", "a") do |line|
		line.puts input.chomp
	end
end

def addNewUser(account, password)
	File.open("users.txt", "a") do |line|
		line.puts "#{account}, #{password}"
	end
end
def checkLogInInfo(account, password)
	validUser = false
	
	CSV.foreach("users.txt", {headers: true, return_headers: false}) do |row|
		  if row["Username"].chomp == account && row["Password"].chomp == password
		  	setUser(row["Username"])
		  end
	end

	return validUser
end


def setUser(account)
	session[:id] = account
end
def loginBar
	loggedIN =""
	logOUT =""
	if session[:id] == nil
		loggedIN = "<p style=\"text-align:left;\"> <a href=\"/login\">Login</a>"
		logOUT = "<span style=\"float:right;\"> <a href=\"new_user\" class=\"logout\"\">Create Account</a> </span></p>"
	else
		loggedIN = "<p style=\"text-align:left;\"> <a href =\"/admin\" class=\"login\">Current User: " + session[:id].to_s.chomp + "</a>"
		logOUT = "<span style=\"float:right;\"> <a href=\"/log_out\" class=\"logout\"\">Log Out</a> </span></p>"
	end
	

	return "<div class=\"login\">" + loggedIN + logOUT + "</div>"
end

def permitAccess
	access = false
	if session[:id] == nil
		access = false
	else
		access = true
	end
	return access
end






