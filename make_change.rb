def make_change(total,coins = [25,10,5,1])
  min_solution = []
  if total == 0
    return []
  end

  has_min_solution = false
  min_solution = []

  coins.each do |coin|

    temp_solution = []

    if total >= coin
      temp_solution = [coin] + make_change(total - coin, coins)
      if !has_min_solution
        has_min_solution = true
        min_solution = temp_solution
      elsif min_solution.length > temp_solution.length
        min_solution = temp_solution
      end

    end
  end

  min_solution
end

p make_change(49, [25, 7, 1])
