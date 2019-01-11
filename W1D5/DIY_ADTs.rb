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
      self.stack_var = self.stack_var[0...-1]
    end
    # returns, but doesn't remove, the top element in the stack
    def peek
      self.stack_var[-1]
    end
  end