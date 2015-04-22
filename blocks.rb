# In-class Calculate Sample

puts "SAMPLE:"

def calculate(num1,num2, &callback)
	puts callback.call(num1,num2)
end

calculate(5,10) do |a,b| a * b end

calculate(5,10) { |a,b| a * b }

# or ...

def calculate(num1,num2)
	puts yield(num1,num2)
end

calculate(5,10) do |a,b| a * b end

calculate(5,10) { |a,b| a * b }

# Implement a method each

# Write a method each that takes in an array arr and 
# a block and runs that block on each element of the 
# array.

puts "EACH:"

def each(arr)
	i = 0
	while i < arr.length
		yield(arr[i])
		i += 1
	end
end

each([1,2,3,4]) { |x| puts x + 1 }

# Implement a method map

# The method map takes in an array and a block and returns a new 
# array with the results of calling a provided block on every 
# element in this array. Try to use the each method we defined while 
# creating map

# def map(arr)
#   Code goes in here dont
#   forget to use yield
# end
# If you're code can run this code, then you're good to go

# arr = map([1,2,3]) do |x|
#   x * x
# end

# p arr # => [1,4,9]

puts "MAP:"

def map(arr)
	i = 0
	arr2 = []
	while i < arr.length
		arr2 << yield(arr[i])
		i += 1
	end
end

map([1,2,3]) do |x|
	puts x * x
end

# Implement a method reduce

# The method reduce takes in an array, an accumulator, and a block. 
# The method applies a block against an accumulator and each value 
# of the array reducing it to a single value.

# def reduce(arr,acc)
#   Code goes in here dont
#   forget to use yield
# end
# If you're code can run this code you're good to go

# sum = reduce([1,2,3,4,5], 0) do |memo,val|
#   memo + val
# end

# puts sum # => 15

puts "REDUCE:"


def reduce(arr,acc)
	i = 0
	while i < arr.length
		acc = yield(arr[i], acc)
		i += 1
	end

	return acc
end

sum = reduce([1,2,3,4,5], 0) do |memo,val|
	memo + val
end

puts sum

# Implement a method filter

# The method filter takes an array and a block. The method creates a 
# new array with all elements that pass the test implemented by the 
# provided function.

# def filter(arr)
#   Code goes in here dont
#   forget to use yield
# end
# If you're code can run this code you're good to go

# filt = filter([1,2,3,4,5,6,7,8]) do |x|
#   x.even?
# end

# p filt # => [2,4,6,8]

puts "FILTER:"

def filter(arr)
	i = 0
	arr2 = []
	while i < arr.length
		if yield(arr[i])
			arr2 << arr[i]
		end
		i += 1
	end

	return arr2
end

filt = filter([1,2,3,4,5,6,7,8]) do |x|
	x.even?
end

puts filt