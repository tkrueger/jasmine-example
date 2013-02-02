These days, we're dusting off the last nodejs application. In the meantime, I thoroughly enjoyed using Jasmine
and Guard in Ruby, and didn't feel like having to give that up. If anything, an all-Javascript application has to
be easier to test, no?

Turns out that there isn't much of a problem bringing this little stack to Node. First of all, we need to declare that
we want to use jasmine-node in our application. I would suggest using the "devDepedencies" in the package.json for this
so that the package won't be installed in production unnecessarily. I've thrown in coffee-script for good measure,
because to me that is part of what's making JS development fun.


===
    "dependencies": {
        "coffee-script" : "1.3.3"
    },
    "devDependencies": {
        "jasmine-node": "1.0.26"
    }
===

Running "npm install" will download these modules and install them into the project folder. To be able to run jasmine-node
from the command line, you can execute "npm install jasmine-node -g". You will most likely have to run that as root.

On a basic level, this is all that is necessary. Now if we place a littel demo spec under /specs:

=== 
describe "A demo spec", ->
  it "should be easy to do", ->
    expect(true).toBeTruthy()
===

, we can execute the specs using "jasmine-node --coffee spec".

[Using Guard to run specs on changes]

Guard [link] is a general purpose tool coming from the ruby world and is used to watch for file changes and react to them. Interestlingly enough, it is
not limited to being used in connection with ruby - it can be used to react to any file change in very nearly every way you can imagine. Give it a thorough look on, you will see that use the cases come into your head by themselves.

Let's set it up to watch for file changes and react by executing the correspondin spec to the file that has changed. If you have
ruby installed on your system, all you have to to is execute "guard init jasmine-node". This will place a template guardfile
in the current folder, which you can use right away as simply as executing "guard".

[Using libnotify]
On my machine, I got an error each time jasmine wanted to notify me of the results. This was because "gntp" wasn't installed.
Easily rectified by adding a line to the Guardfile that tells Guard to use libnotify instead:

notification :libnotify, :timeout => 5, :transient => true, :append => false

This is just one example of how versatile Guard is. You'll learn to love it.


[stuff]
- There is a little glitch in the generated Guardfile:
watch(%r{^lib/(.+)\.(js\.coffee|js)|coffee}) should read watch(%r{^lib/(.+)\.(js\.coffee|js|coffee)}) to work correctly on 
.coffee files.
- the line for running changed spec files can actually be simplified to watch(%r{^spec/(.+)_spec\.(js\.coffee|js|coffee)}) { |m| m }, giving the unprocessed path of the changed file to jasmine-node.

