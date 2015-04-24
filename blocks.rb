require 'byebug'

class Array
  def my_each(&prc)
    i = 0;
    while i < self.size
      prc.call(self[i])
      i += 1
    end
  end

  def my_map(&prc)
    a = Array.new
    self.my_each do |el|
      # byebug
      a << prc.call(el)
    end
    a
  end

  def my_select(&prc)
    a = Array.new
    self.my_each do |el|
      a << el if prc.call(el)
    end
    a
  end

  def my_inject(&prc)
    memo = self[0]
    if self.size > 1
      self[1..-1].my_each do |el|
        memo = prc.call(memo,el)
      end
    end
    memo
  end

  def my_sort! (&prc)
    sorted = false
    until sorted == true
      sorted = true
      self[0..-2].each_with_index do |el,i|
        if prc.call(el,self[i + 1]) == 1
          self[i],self[i+1] = self[i + 1],self[i]
          sorted = false
        end
      end
    end
    self
  end

  def my_sort(&prc)
    arr = self.dup
    arr.my_sort!(&prc)
  end

end

def eval_block (*splat,&proc)
  if proc == nil
    puts "No block given"
  else
    proc.call(*splat)
  end
end

eval_block("Kerry", "Washington", 23) do |fname, lname, score|
  puts "#{lname}, #{fname} won #{score} votes."
end

val = eval_block(1,2,3,4,5) do |*args|
  args.inject(:+)
end

puts val
