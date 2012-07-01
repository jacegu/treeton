require 'treeton/grammar/json'

module Treeton
  class Parser
    include Json

    def initialize(grammar_parser = JsonParser.new)
      @parser = grammar_parser
    end

    def parse(input)
      @parser.parse(input).translate
    end
  end
end
