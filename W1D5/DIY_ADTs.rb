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