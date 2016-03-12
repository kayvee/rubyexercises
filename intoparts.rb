require 'byebug'

# exp(b, n) = b * exp(b, n - 1)

# >>becomes>>

# exponent(base, power) = base * exponent(base, power - 1)

# >>becomes>>

# smaller_exponent = power - 1
# base_to_the_smaller_exponent = exponent(base, smaller_exponent)
#
# exponent(base, power) = base * base_to_the_smaller_exponent

# The method below estimates how much money your child
# will have when they retire, based on your age.

def return_number(a)
  ((a / 2)**2) * (65 - (a / 2))
end

# >>becomes>>

def child_account_amount_at_retirement(your_age)
  child_age = your_age / 2
  years_until_child_retirement = 65 - child_age
  current_account_amount = child_age ** 2

  current_account_amount * years_until_child_retirement
end
