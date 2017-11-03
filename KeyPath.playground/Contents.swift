//: Playground - noun: a place where people can play

import UIKit

struct Foo {
    var bar = "bar"
    var baz = [1, 2, 3, 4]
}

var foo = Foo()
foo.bar = "BAR"
let barKeyPath = \Foo.bar
let bar = foo[keyPath: barKeyPath]
foo[keyPath: barKeyPath] = "Bar"

//foo[keyPath: \Foo.baz[1]]
