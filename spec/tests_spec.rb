# 1. Setup
# 2. Exercise	
# 3. Verify
# 4. Teardown

require "spec_helper"
require_relative "../functions.rb"



# Checks math for account calculations
# describe "calculations" do 
# 	it "adds a list of numbers to find a balance" do
# 		# Exercise
# 		result = getBalance([300, 500, 700, 900, 1100])

# 		# Verify
# 		expect(result).to eq(3500)

# 	end

# 	it "finds the average of a list of numbers" do
# 		# Exercise
# 		result = getAvg([300, 500, 700, 900, 1100])

# 		# Verify
# 		expect(result).to eq(700)

# 	end

# 	it "adds a number to another number" do
# 		# Exercise
# 		result = getTally([2400, 1100])

# 		# Verify
# 		expect(result).to eq(3500)

# 	end
# end

# Checks to see if files are being read from/can be written too
# describe "read / write files" do
# 	it "opens a file and reads a line" do
# 		# Exercise
# 		result = readFile("testread.txt")

# 		# Verify
# 		expect(result).to eq("test line")

# 	end

# 	it "verifies all of the lines are being read and converted to a hash" do
# 		# Exercise
# 		result = readLines("testread.txt")

# 		# Verify
# 		expect(result).to eq({some hash value})

# 	end

# 	it "adds a line to a file" do
# 		# Exercise
# 		result = writeLines("testread.txt", "a test string to write")

# 		# Verify
# 		expect(result).to eq("a test string to write")

# 	end
# end

# Checks formatting on various string returns
describe "formatting" do
	it "creates a string from various values to write to a file" do
		# Exercise
		testHash = {Account: "Kamin", Date: "2/2/2017", Payee: "Target", Category: "Clothes", Outflow: "50.00", Inflow: "0.00"}
		result = convertInput(testHash)

		# Verify
		expect(result).to eq("Kamin,2/2/2017,Target,Clothes,$50.00,$0.00")
	end

	it "given some information, returns a string containing a table in html format" do
		# Setup
		testHash ={"Sonia"=>
		  {:tally=>67.50,
		   :categories=>
		    {"Allowance"=>{:tally=>100.0, :num_transactions=>1, :average_transaction_cost=>100.0},
		     "Household Goods"=>{:tally=>-20.50, :num_transactions=>2, :average_transaction_cost=>-10.25},
		     "Clothes"=>{:tally=>-12.0, :num_transactions=>2, :average_transaction_cost=>-6.0}
    	}}}
    	# Exercise
		result = printAccount(testHash)

		# Verify
		expect(result).to eq("<h1>Account: Sonia... Balance: $67.50</h1><table><tr><th> Category </th><th> Total Spent </th><th> Average Transaction</th></tr><tr><td>Allowance</td><td>$100.00</td><td> $100.00</td></tr><tr><td>Household Goods</td><td>$-20.50</td><td> $-10.25</td></tr><tr><td>Clothes</td><td>$-12.00</td><td> $-6.00</td></tr></table>")


# def printAccount (accountInfo)  
# 	accountInfo.each do |name, info| 
# 		html = "<h1>Account: Sonia... Balance: $67.50</h1><table><tr><th> Category </th><th> Total Spent </th><th> Average Transaction</th></tr><tr><td>Allowance</td><td>$100.00</td><td> $100.00</td></tr><tr><td>Household Goods</td><td>$-20.50</td><td> $-10.25</td></tr><tr><td>Clothes</td><td>$-12.00</td><td> $-6.00</td></tr></table>"
#     end 




	end
end