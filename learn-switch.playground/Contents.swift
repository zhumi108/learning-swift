//: Playground - noun: a place where people can play

import UIKit

//1. basic switch-type match
enum Direction {
    case North, South, East, West
}

extension Direction: CustomStringConvertible {
    var description: String {
        switch self {
        case .North: return "↑"
        case .South: return "↓"
        case .East: return "→"
        case .West: return "←"
        }
    }
}

let direction: Direction = .East
print(direction.description)

//2. binding value
enum Media {
    case Book(title: String, author: String, year: Int)
    case Movie(title: String, director: String, year: Int)
    case WebSite(url: URL, title: String)
}

extension Media {
    var mediaTitle: String {
        switch self {
        case let .Book(title: aTitle, author: _, year: _):
            return aTitle
        case let .Movie(title: aTitle, director: _, year: _):
            return aTitle
        case let .WebSite(url: _, title: aTitle):
            return aTitle
        }
    }
}

let book = Media.Book(title: "Harry Potter", author: "Jeremy", year: 2012)
print(book.mediaTitle)


//3.tuple
let point = CGPoint(x: 7, y: 7)
switch (point.x, point.y) {
case (0, 0): print("On the origin")
case(0, _): print("On the Y-axis")
case(_, 0): print("On the X-axis")
case let (x, y) where x == y: print("on line y = x")
default: print("Quite a random point here")
}

//4.match between types
protocol Medium {
    var title: String { get }
}

struct Book: Medium {
    let title: String
    let author: String
    let year: Int
}

struct Movie: Medium {
    let title: String
    let director: String
    let year: Int
}

struct Website: Medium {
    let title: String
    let url: URL
}

let medias: [Medium] = [
    Book(title: "Harry Potter", author: "Jeremy", year: 2012),
    Movie(title: "Tom andJerry", director: "Catherina", year: 2015)
]

for media in medias {
    print(media.title)
    
    switch media {
    case let book as Book:
        print("book was published in year \(book.year)")
    case let movie as Movie:
        print("movie was published in year \(movie.year)")
    //no need to use a website, so no need to create a constant
    case is Website:
        print("A website with no date")
    default:
        print("No year info for \(media)")
    }
}

//5. 只匹配一种情形,可以用以下的简便写法
let m1 = Media.Movie(title: "Captain America: Civil War", director: "Russo Brothers", year: 2016)

if case let Media.Movie(title, _, _) = m1 /* where year < 1888 */ {
    print("This is a movie named \(title)")
}

//等价于
switch m1 {
case let Media.Movie(title, _, _):
    print("This is a movie named \(title)")
default:
    print("End")
}


//5. for case
let mediaList: [Media] = [
    .Book(title: "Harry Potter and the Philosopher's Stone", author: "J.K. Rowling", year: 1997),
    .Movie(title: "Harry Potter and the Philosopher's Stone", director: "Chris Columbus", year: 2001),
    .Book(title: "Harry Potter and the Chamber of Secrets", author: "J.K. Rowling", year: 1999),
    .Movie(title: "Harry Potter and the Chamber of Secrets", director: "Chris Columbus", year: 2002),
    .Book(title: "Harry Potter and the Prisoner of Azkaban", author: "J.K. Rowling", year: 1999),
    .Movie(title: "Harry Potter and the Prisoner of Azkaban", director: "Alfonso Cuarón", year: 2004),
    .Movie(title: "J.K. Rowling: A Year in the Life", director: "James Runcie", year: 2007),
    .WebSite(urlString: "https://en.wikipedia.org/wiki/List_of_Harry_Potter-related_topics")
]

print("Movies only:")
for case let Media.Movie(title, _, year) in mediaList {
    print(" - \(title) (\(year))")
}







