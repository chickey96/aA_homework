require "byebug"
class Stack
    attr_accessor :stack_var
    def initialize
      @stack_var = []
    end
    # adds an element to the stack
    def push(el)
      self.stack_var << el 
    end
    # removes one element from the stack
    def pop
      last_el = self.stack_var[-1] # not sure if method should return last el
      self.stack_var = self.stack_var[0...-1]
      last_el
    end
    # returns, but doesn't remove, the top element in the stack
    def peek
      self.stack_var[-1]
    end
end

class Queue
    attr_accessor :queue_var
    def initialize 
        @queue_var = []
    end
    # add elements to left side of queue array
    def enqueue(el)
        self.queue_var = [el] + self.queue_var  
    end
    # remove elements from the right side of queue array
    def dequeue
        last_el = self.queue_var[-1]
        self.queue_var = self.queue_var[0...-1]
        last_el 
    end
    # look at the element that would be removed next
    def peek 
        self.queue_var[-1]
    end
end

class Map
    attr_accessor :map_var
    def initialize 
        @map_var = [[]]
    end
    # updates existing key to given value or creates new key value pair
    def set(key, value)
        updated = false
        if self.map_var[0].empty?
            self.map_var[0] = [key, value]
            updated = true
        else  
            self.map_var.each do |pair| 
                if pair[0] == key  
                  pair[1] = value 
                  updated = true
                end
            end 
        end
        self.map_var << [key, value] if !updated
        updated   
    end
    # returns value corresponding to given key
    def get(key)
        self.map_var.each do |pair|
            return pair[1] if pair[0] == key
        end
        nil
    end
    # deletes key value pair
    def delete(key)
        self.map_var.each_with_index do |pair, idx|
            if pair[0] == key 
                first_half = self.map_var[0...idx] 
                second_half = self.map_var[idx+1..-1]
                self.map_var = first_half + second_half
                break
            end 
        end
    end
    # displays whole map?
    def show
        self.map_var.each do |pair|
            display = "#{pair[0]} => #{pair[1]}"
            puts display
        end
    end
end