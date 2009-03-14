module Heist
  class Runtime
    
    class Binding
      include Expression
      
      attr_reader :expression, :scope
      
      def initialize(expression, scope, memoized = true)
        @expression = expression
        @scope      = scope
        @memoized   = !!memoized
      end
      
      def force!
        return @value if defined?(@value) and @memoized
        @value = Heist.evaluate(@expression, @scope)
      end
      
      def eval(scope)
        force!
      end
      
      def to_s
        @expression.to_s
      end
    end
    
  end
end

