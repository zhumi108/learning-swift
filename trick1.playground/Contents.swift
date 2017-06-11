//: Playground - noun: a place where people can play

import UIKit


/// Change the value of two parameters
///
/// - Parameters:
///   - a: first parameter
///   - b: second parameter
func swap<T>(a: inout T, b: inout T) {
    (a, b) = (b, a)
    print(a, b)
}

var a = "s", b = "h"

swap(a: &a, b: &b)

var c = a

// MARK: - print the pointer address of a varaible
withUnsafePointer(to: &a) { print("\($0)") }
withUnsafePointer(to: &c) { print("\($0)") }


let version1 = ["3", "14", "10"]

let version2 = ["3", "130", "10"]

// Compare two arrays in the lexicographical(dictionary) way
version2.lexicographicallyPrecedes(version1)

var numbers = [30, 40, 20, 30, 30, 60, 10]

// separate an array with the boundary 30
let p = numbers.partition(by: { $0 > 30 })

let dic = ["One": "1", "Two": "2", "Three": "3"]

// divide
8.truncatingRemainder(dividingBy: 2.5)

// the pointer address of an array 
let pointer = version1.withUnsafeBufferPointer {
    return String(describing: $0)
}
print(pointer)












