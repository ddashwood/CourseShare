loan_text = input("Enter Loan Amount:")
rate_text = input("Enter Interest Rate:")
loan = float(loan_text)
rate = float(rate_text)
interest = loan * rate / 100.0
print("Interest is ", interest)
