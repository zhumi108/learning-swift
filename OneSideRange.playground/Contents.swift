//: Playground - noun: a place where people can play

import UIKit

let s = "Hello Mars"
var i = s.index(of: " ")!
let greeting = s[..<i]

i = s.index(i, offsetBy: 1)
let name = s[i...]

print(Array(zip(1..., s)))

let n = 10
switch n {
case 6...:
    print(">=6")
default:
    break
}



