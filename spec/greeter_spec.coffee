Greeter = require( "../lib/greeter").Greeter

describe "a Greeter greeting a person", ->
  beforeEach ->
    @greeter = new Greeter("Fritz")
    @greeting = @greeter.sayHelloTo "Werner"

  it "should adress the person by name", ->
    expect(@greeting).toContain "Werner"

