def range(start,finish)
  if(finish < start)
    return []
  elsif (finish == start)
    return [finish]
  end
  [start] + range(start + 1,finish)
end

def arr_sum_recursive(arr)
   if arr.empty?
     return 0
   elsif arr.size == 1
     return arr[0]
   end
   arr.first + arr_sum_recursive(arr[1..-1])
end

def arr_sum_iterative(arr)
  sum = 0
  arr.each do |i|
    sum += i
  end
  sum
end

def exp(val,exp)
  if exp == 0
    return 1
  end
  val * exp(val,exp-1)
end

def exp_2(val,exp)
  if exp == 0
    return 1
  elsif exp == 1
    return val
  end

  if exp % 2 == 0
    exp_2(val, exp / 2) * exp_2(val, exp / 2)
  else
    val * (exp_2(val, (exp - 1) / 2) * exp_2(val, (exp - 1) / 2))
  end
end

def deep_dup(array)
    new_arr = []
  if !array.is_a? Array
    return array
  else
    array.each do |el|
      new_arr << deep_dup(el)
    end
  end
  new_arr
end

def fibonacci(n)
  if n == 0
    return []
  elsif n == 1
    return [1]
  elsif n == 2
    return [1,1]
  end

  arr = fibonacci(n - 1)
  arr + [arr.last + arr[arr.size - 2]]
end

def bsearch(array,target)
  pivot = array.length / 2
  if array[pivot] == nil
    return nil
  elsif array[pivot] == target
    return pivot
  elsif array[pivot] > target && pivot == 0
    return nil
  elsif array[pivot] > target

    bsearch_val = bsearch(array[0..pivot-1],target)
    if bsearch_val != nil
      return pivot - ( array[0..pivot-1].size - bsearch_val )
    else
      return nil
    end
  elsif array[pivot] < target
    bsearch_val = bsearch(array[pivot+1..-1],target)
    if bsearch_val != nil
      return pivot + 1 + bsearch_val
    else
      return nil
    end
  end
end

def merge_sort(arr)
  p arr
  if arr.length == 0
    return []
  elsif arr.length == 1
    return arr
  end

  pivot = arr.length / 2
  merge(merge_sort(arr[0...pivot]),merge_sort(arr[pivot..-1]))


end



def merge(arr1,arr2)
  final = []
  while !arr1.empty? && !arr2.empty?
    case arr1[0] <=> arr2[0]
    when -1
      final << arr1.shift
    when 0
      final << arr1.shift
      final << arr2.shift
    when 1
      final << arr2.shift
    end
  end
  final + arr1 + arr2
end

def subsets(array)
  if array.empty?
    return [[]]
  # elsif array.length == 1
  #   return [[],array]
  else
    smaller_subsets = subsets(array[0...-1])
    bigger_subsets = deep_dup(smaller_subsets).map {|set| set << array[-1]}
    smaller_subsets + bigger_subsets


  end

end

p subsets([0,1,2,3,4,5])
