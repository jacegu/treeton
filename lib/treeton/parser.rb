require 'treeton/grammar/json'

module Treeton
  class Parser
    include Json

    def initialize(grammar_parser = JsonParser.new)
      @parser = grammar_parser
    end

    def parse(input)
      translate @parser.parse(input)
    end

    private

    def translate(parse_result)
      raise SyntaxError.new(@parser) if parse_result.nil?
      parse_result.translate
    end
  end

  class SyntaxError < Exception
    def initialize(parser)
      super parser.failure_reason
    end
  end
end
