# Returns true if the input positive integer number forms a palindrome. Returns false otherwise.
# Time complexity: O(n), where n is the length of the number in digits
# Space complexity: O(1)?
def is_palindrome(number)
  return false if number == nil || number < 0

  right_num_divisor = 1
  right_num_modulo = 10
  left_num_divisor = 10 ** (number_length(number) - 1)

  (number_length(number) / 2).times do
    left_num = number / left_num_divisor % 10
    right_num = number % right_num_modulo / right_num_divisor

    return false unless left_num == right_num

    left_num_divisor /= 10
    right_num_divisor *= 10
    right_num_modulo *= 10
  end

  return true
end

def number_length(number)
  divisor = 1
  digits = 0
  quotient = number % divisor
  previous_quotient = nil
  until previous_quotient == quotient
    digits += 1
    previous_quotient = number % divisor
    divisor *= 10
    quotient = number % divisor
  end

  # go to last one
  digits -= 1
  divisor /= 10

  return digits
end
