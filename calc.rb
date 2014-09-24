require 'pry'

# Addition
def addition(left, right)
  left + right
end

# Subtraction
def subtraction(left, right)
  left - right
end

# Multiplication
def multiplication(left, right)
  left * right
end

# Division
# - handle mixed Float and Fixnum
# - handle division by 0
def division(dividend, divisor)
  # Handle division by 0
  if divisor == 0
    return "error: Division by 0 is illegal"
  end

  # Make sure we return a float result when divisor is greater than dividend
  if dividend < divisor then divisor = divisor.to_f end
  dividend/divisor
end

# Create a menu of operations
def operations_menu
  puts "Please tell me what you want to do:"
  puts "addition? (y/n)"
  if gets.chomp == "y" then return 'add' end

  puts "subtraction? (y/n)"
  if gets.chomp == "y" then return 'subtract' end

  puts "multiplication? (y/n)"
  if gets.chomp == "y" then return 'multiply' end

  puts "division? (y/n)"
  if gets.chomp == "y" then return 'divide' end

  # Calculator doesn't support anything else
  puts "Sorry, this calculator has no other operations"

  return ""
end

# This can be used to get either operand
# We assume anthing that has a "." is a float
def get_operand(type)
  puts "Enter #{type} operand:"
  num = gets.chomp
  if num.include?('.')
    return num.to_f
  end
  return num.to_i
end


# Get operation to perform and values
def perform_operation(operation, left_operand, right_operand)
  result = nil

  if operation == 'add'
    result = addition(left_operand, right_operand)
  elsif operation == 'subtract'
    result = subtraction(left_operand, right_operand)
  elsif operation == 'multiply'
    result = multiplication(left_operand, right_operand)
  elsif operation == 'divide'
    result = division(left_operand, right_operand)
 #   binding.pry
  end
  result
end

def output_result(operation, result, left, right)
  puts "\n\nRESULT:"
  if operation == ""
    puts "Unknown operation - no result to report"
  else
    puts "#{operation}(#{left}, #{right}) = #{result}"
  end
  puts "\n"
end


# Call the things :)
operation = operations_menu
unless operation == ""
  left = get_operand('left')
  right = get_operand('right')
  result = perform_operation(operation, left, right)
  output_result(operation, result,left, right)
end

