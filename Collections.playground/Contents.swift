//: Playground - noun: a place where people can play

import UIKit

let numberSet = Set(1...100)
let evens = numberSet.lazy.filter { $0 % 2 == 0 }
let evenSet = Set(evens)
evenSet.isSubset(of: numberSet)

let numberDictionary = ["one": 1, "two": 2, "three": 3, "four": 4]
let evenColl = numberDictionary.lazy.filter { $0.value % 2 == 0 }

let evenDictionary = Dictionary(uniqueKeysWithValues: evenColl.map { (key: $0.key, value: $0.value) })

let numbers = ["one", "two", "three", "four"]
print(Dictionary(uniqueKeysWithValues: numbers.enumerated().map { ($0.1, $0.0 + 1) }))
print(Dictionary(uniqueKeysWithValues: zip(numbers, 1...)))

let duplicates = [("a", 1), ("b", 2), ("a", 3), ("b", 4)]
let letters = Dictionary(duplicates, uniquingKeysWith: /* (value, value) -> value */ { first, _ in first })

let names = ["Aaron", "Abe", "Bain", "Bally", "Bald", "Mars", "Nacci"]
let groupNames = Dictionary(grouping: names, by: { $0.first! })

var frequencies: [Character: Int] = [:]
let characters = "aaabbbbcccceeee"
characters.forEach {
    frequencies[$0, default: 0] += 1
}

print(numberDictionary.mapValues { Double($0) })

var ints = [1, 2, 3, 4, 5]
ints.swapAt(0, 4)







