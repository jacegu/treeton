# Treeton

Treeton is a JSON parser built on the top of
[Treetop](http://treetop.rubyforge.org).

This is a pet project I've developed to learn about grammars and parser
generators. In the meantime I have also gotten a deeper understanding of the
JSON format.


## Disclaimer

Despite it has a really cool name **this project is not intended
to be used in production environments**.

If you don't want to believe me and think that Treeton is so cool that it's
worth a try, let me throw a couple benchmarks at you.

This is the profiling of Treeton and Yajl when parsing the same JSON:

//TODO


## Usage

//TODO


## The Grammar

You can read the whole
[JSON rfc](http://www.ietf.org/rfc/rfc4627.txt)
but you can get the grammar in a nutshell just by looking at the railroad
diagrams.

I picked JSON grammar for this experiment because its fairly simple. It is
basically composed by six types: `booleans`, `strings`, `numbers`, `arrays`,
`objects` and `null`.

Lets look at the grammar of each one of them, and how it has been translated
to Treetop rules:

### Values

![Railroad diagram for value grammar](http://json.org/value.gif "railroad for values")

Which is translated nicely into:

```ruby
  rule value
    string / number / array / object / true / false / null
  end
end
```

The boolean values `true`, `false` and the `null` value are terminals expressed
in their own rules:

```ruby
  rule true
    'true'
  end

  rule false
    'false'
  end

  rule null
    'null'
  end
```

### Numbers

![Railroad diagram for numbers grammar](http://json.org/number.gif "railroad for numbers")

This has been translated into the following rule:

```ruby
  rule number
    integer_part decimal_part? exponent?
  end
```

You can chechout the detailed rules in the
[numbers grammar](https://github.com/jacegu/treeton/blob/master/lib/treeton/grammar/number.treetop).


### Strings

![Railroad diagram for strings grammar](http://json.org/string.gif "railroad for values")

The rule for strings is pretty straightforward:

```ruby
  rule string
    quotation_mark (escaped_character / character)* quotation_mark
  end
```

The definition of each of this sub-rules can be found in the
[strings grammar](https://github.com/jacegu/treeton/blob/master/lib/treeton/grammar/string.treetop).


### Arrays

![Railroad diagram for arrays grammar](http://json.org/array.gif "railroad for arrays")

In this case the rule gets a little bit uglier in order to handle the three
possible cases: empty array, array with a single element, array with more than
one element.

Notice the reference to the previous rule, `value`, which makes the `array`
able to hold any of the types recognized by JSON grammar.

```ruby
  rule array
    open_square_bracket value? (comma value)* close_square_bracket
  end
```

The sub-rules can be found in the 
[arrays grammar](https://github.com/jacegu/treeton/blob/master/lib/treeton/grammar/array.treetop).


### Objects

![Railroad diagram for objects grammar](http://json.org/object.gif "railroad for objects")

Object grammar rule is pretty similar to the array's one

```ruby
  rule object
    open_curly_brace (string colon value)? (comma string colon value)* close_curly_brace
  end
```

The sub-rules can be found in the 
[objects grammar](https://github.com/jacegu/treeton/blob/master/lib/treeton/grammar/object.treetop).

The `comma` rule is defined in the
[arrays grammar](https://github.com/jacegu/treeton/blob/master/lib/treeton/grammar/array.treetop).
