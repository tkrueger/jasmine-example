class Greeter
  constructor: (name) ->
    @name

  sayHelloTo: (person) ->
    "Hi there, #{person}! I'm #{@name}"


exports.Greeter = Greeter