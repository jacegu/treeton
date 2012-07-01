module Treeton

  class StringNode < Treetop::Runtime::SyntaxNode
    def translate
      eval text_value
    end
  end

  class NumberNode < Treetop::Runtime::SyntaxNode
    def translate
      eval text_value
    end
  end

  class TrueNode < Treetop::Runtime::SyntaxNode
    def translate
      true
    end
  end

  class FalseNode < Treetop::Runtime::SyntaxNode
    def translate
      false
    end
  end

  class NilNode < Treetop::Runtime::SyntaxNode
    def translate
      nil
    end
  end

end
