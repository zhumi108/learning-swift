//: Playground - noun: a place where people can play

import UIKit

struct JSON {
    private var data: [String: Any]
    
    init(data: [String: Any]) {
        self.data = data
    }
    
    subscript<T>(key: String) -> T? {
        return data[key] as? T
    }
}

let json = JSON(data: [
    "title": "Generic subscript",
    "duration": 30
    ])

let title: String? = json["title"]
let duration: Int? = json["duration"]

class MyViewController {
    func setUp(viewController: UIViewController & UITableViewDelegate & UITableViewDataSource) {}
}
