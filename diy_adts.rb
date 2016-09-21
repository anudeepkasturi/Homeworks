class Stack
  def initialize
    @stack = []
  end

  def add(el)
    @stack.push(el)
  end

  def remove
    @stack.pop
  end

  def show
    @stack.each_with_index {|el, idx| puts "#{idx}: #{el}"}
  end
end

class Queue
  def initialize
    @queue = []
  end

  def enqueue(el)
    @queue.unshift(el)
  end

  def dequeue
    @queue.shift
  end

  def show
    @queue.each_with_index {|el, idx| puts "#{idx}: #{el}"}
  end
end

class Map

  def initialize
    @map = []
  end

  def assign(key, value)
    self.remove(key) if keys.include?(key)
    @map << [key, value]
  end

  def lookup(key)
    @map[keys.index(key)][1] if keys.include? key
  end

  def remove(key)
    @map.delete_at(keys.index(key))
  end

  def show
    @map.each { |kv_pair| puts "#{kv_pair[0]} => #{kv_pair[1]}"}
  end

  def keys
    @map.map {|kv_pair| kv_pair[0]}
  end
end
